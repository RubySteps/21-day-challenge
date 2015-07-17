# 004/11

## Don’t build extra blank lines in the first place

Let’s start by adding two failing tests:

```ruby
# spec/entry_builder_spec.rb
context "blank lines" do
  context "strips initial / final" do
    it "does" do
      raw = ["",
             "> LENNOX",
             "> > Sent he to Macduff?",
             ""]
      expected = Entry.new([Line.new(1, "LENNOX"),
                            Line.new(2, "Sent he to Macduff?")])
      b = EntryBuilder.new(raw)
      lines_match(expected, b.build)
    end
  end
  context "strips multiple medial" do
    it "does" do
      raw = ["> LENNOX",
             "> > Sent he to Macduff?",
             "",
             "",
             "> LORD"]
      expected = Entry.new([Line.new(1, "LENNOX"),
                            Line.new(2, "Sent he to Macduff?"),
                            Line.new(""),
                            Line.new(1, "LORD")])
      b = EntryBuilder.new(raw)
      lines_match(expected, b.build)
    end
  end
end
```

We can make the first one pass with a similar `#lines_trimmed` approach as used for `Entry#paragraphs`:

```ruby
def build_lines
  lines_trimmed.inject([]) do |result, raw_line|
    result << new_line(raw_line, previous_indent(result))
    result
  end
end

def lines_trimmed
  start = first_non_blank_index(@raw_lines)
  finish = first_non_blank_index(@raw_lines.reverse)
  @raw_lines[start..-(finish + 1)]
end

def first_non_blank_index(lines)
  lines.each_with_index do |l, index|
    return index if l != ""
  end
end
```

and for that matter, we can make the second one pass with the `second_blank_line` check also used before:

```ruby
def build_lines
  lines_trimmed.inject([]) do |result, line|
    build_next_line(result, line)
  end
end

def build_next_line(result, line)
  unless second_blank_line(result, line)
    result << new_line(line, previous_indent(result))
  end
  result
end

def second_blank_line(result, line)
  line == "" && result.last.text == ""
end
```

At which point – partly because we mostly split `#build_next_line` out of `#build_lines` to avoid a six-line method – it becomes obvious that if we’re trimming out leading and trailing blank lines, we could trim consecutive blank lines out of the middle as well and not then require the `unless second_blank_line()` check, with something like this:

```ruby
def build_lines
  trimmed(@raw_lines).inject([]) do |result, line|
    result << new_line(line, previous_indent(result))
  end
end

def trimmed(lines)
  lines = trim_empty_start_and_finish(lines)
  trim_empty_duplicate_middle(lines)
end

def trim_empty_start_and_finish(lines)
  start = first_non_empty(lines)
  finish = first_non_empty(lines.reverse)
  lines[start..-(finish + 1)]
end

def first_non_empty(lines)
  lines.each_with_index do |l, index|
    return index unless l.empty?
  end
end

def trim_empty_duplicate_middle(lines)
  lines.inject([]) do |result, line|
    result << line unless (line.empty? && result.last.empty?)
    result
  end
end
```

We’ve had to add a method to Line to get this to work:

```ruby
# lib/line.rb
def empty?
  text == ""
end
```

but because of the proliferation of `line.text == ""` checks, we've been meaning to do this for ages.  The big advantage of this is that the same `#trimmed` method code now works on both the lines from EntryBuilder and Entry – because `line.empty? && result.last.empty?` is equivalent to both EntryBuilder's `line == "" && result.last.text == ""` and Entry's `line.text == "" && result.last == []` – so we can extract it into a module:

```ruby
module Trimmer
  def trimmed(lines)
    lines = trim_empty_start_and_finish(lines)
    trim_empty_duplicate_middle(lines)
  end

  def trim_empty_start_and_finish(lines)
    start = first_non_empty(lines)
    finish = first_non_empty(lines.reverse)
    lines[start..-(finish + 1)]
  end

  def first_non_empty(lines)
    lines.each_with_index do |l, index|
      return index unless l.empty?
    end
  end

  def trim_empty_duplicate_middle(lines)
    lines.inject([]) do |result, line|
      result << line unless (line.empty? && result.last.empty?)
      result
    end
  end
end
```

include it in both Entry and EntryBuilder:

```ruby
# lib/entry_builder.rb
require 'trimmer'

class EntryBuilder
  include Trimmer
```

and then strip out the `#lines_trimmed`, `#first_non_blank_index`, and `#second_blank_line` code from both classes, because the Trimmer module now handles that.
