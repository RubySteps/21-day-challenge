# 004-02

Let’s start with the export-to-html part of the problem.  We’ll have an entry, which has a collection of lines, which is shorthand for “things which are verse lines if they’re in verse and prose lines i.e. paragraphs if they aren’t”.  Lines will have an indent level, and crazy levels of nesting will have to be supported.

Problem: how do you tell between:
- a prose line with indent 2 which should end with a “paragraph” break
- a verse line with indent 2 within a stanza which should end with a “line” break
- a verse line with indent 2 at the end of a stanza which should end with a “paragraph” break

In normal typography, we’d know because cases 1 and 3 are followed by a blank line.  Let’s assume that when we’re formatting an entry for display we’ve got that, whether it is represented in the model layer by an actual blank line or by a flag on the line that remembers whether it should be followed by a blank line.

Let’s start trying this out.  We don’t really care about the rest of the app at this point, so let’s build the minimal framework to support an HtmlFormatter that takes an Entry and formats it.

## Minimal Framework Setup

Create an `entries` directory, and add

```bash
echo "2.2.2" >> .ruby-version
echo "entries" >> .ruby-gemset
```

and a Gemfile

```ruby
# Gemfile
source "https://rubygems.org"

gem "rspec"
```

and then

```bash
gem install bundler
bundle install --binstubs
bin/rspec --init
```

And then let's create `lib/` and `spec/` directories and add `spec/html_formatter_spec.rb`.

```ruby
# spec/html_formatter_spec.rb
require_relative "../lib/html_formatter"

RSpec.describe HtmlFormatter, "#format" do
  it "runs" do
    expect(false).to be_truthy
  end
end
```

and `lib/html_formatter.rb`

```ruby
# lib/html_formatter.rb
class HtmlFormatter
end
```

Now that we can see a failing spec (`bin/rspec spec/html_formatter_spec.rb`), let’s get back to testing and modelling.

## Testing and Modelling

### Get the First One Passing

If an HtmlFormatter takes an Entry and calls format on it, the simplest test would be that an empty Entry (an Entry with no Lines) returns an empty string.  Again, let’s focus in on this specific problem, and say that when it gets to the formatter, an Entry has a collection of Lines.

```ruby
# spec/html_formatter_spec.rb
require_relative "../lib/html_formatter"
require_relative "../lib/entry"

RSpec.describe HtmlFormatter, "#format" do
  context "empty" do
    it "returns ''" do
      f = HtmlFormatter.new(Entry.new([]))
      expect(f.format).to eq("")
    end
  end
end
```

```ruby
# lib/entry.rb
class Entry
end
```

This fails with

```ruby
Failure/Error: f = HtmlFormatter.new(Entry.new([]))
ArgumentError:
wrong number of arguments (1 for 0)
```

So we add initializers for both HtmlFormatter and Entry:

```ruby
class HtmlFormatter
  def initialize(entry)
    @entry = entry
  end
end
```

```ruby
class Entry
  def initialize(lines)
    @lines = lines
  end
end
```

and then we get

```ruby
Failure/Error: expect(f.format).to eq("")
NoMethodError:
private method `format' called for #<HtmlFormatter:0x007fe31c9c9d28>
```

and the simple just-get-that-passing is

```ruby
class HtmlFormatter
  def initialize(entry)
    @entry = entry
  end

  def format
    ""
  end
end
```

### Formatting a Single Line

And that’s obviously cheating, so let’s add another test:

```ruby
context "one line" do
  it "returns '<p>one line</p>'" do
    f = HtmlFormatter.new(Entry.new([Line.new("one line")]))
    expect(f.format).to eq("<p>one line</p>")
  end
end
```

This requires us to add a Line class, which again for now let’s make as minimal as possible to concentrate on the html formatting problem (so let's give it an optional indent argument that defaults to 0):

```ruby
# lib/line.rb
class Line
  attr_accessor :indent, :text

  def initialize(indent = 0, text)
    @indent = indent
    @text = text
  end
end
```

and add `require_relative "../lib/line"` to the top of the HtmlFormatterSpec.

Then we get:

```ruby
Failure/Error: expect(f.format).to eq("<p>one line</p>")
expected: "<p>one line</p>"
got: ""
```

We know that around other indented lines we’re going to want different html elements, so let’s add two more tests to flesh this out:

```ruby
  context "one line" do
    context "no indent" do
      it "returns '<p>one line</p>'" do
        f = HtmlFormatter.new(Entry.new([Line.new("one line")]))
        expect(f.format).to eq("<p>one line</p>")
      end
    end
    context "indent 1" do
      it "returns '<blockquote>one line</blockquote>'" do
        f = HtmlFormatter.new(Entry.new([Line.new(1, "one line")]))
        expect(f.format).to eq("<blockquote>one line</blockquote>")
      end
    end
    context "indent 2" do
      it "returns '<blockquote><blockquote>one line</blockquote></blockqute>'" do
        f = HtmlFormatter.new(Entry.new([Line.new(2, "one line")]))
        expect(f.format).to eq("<blockquote><blockquote>one line</blockquote></blockquote>")
      end
    end
  end
```

Now we have three failures, which will usefully drive out the next bit of code.

The simplest code in HtmlFormatter that will make this pass (we’ll need to add `attr_accessor :lines` to Entry to get it to work):

```ruby
  def format
    @entry.lines.collect { |line| format_line(line) }.join("")
  end

  private

  def format_line(line)
    indent = line.indent
    "#{open(indent)}#{line.text}#{close(indent)}"
  end

  def open(indent)
    html_formatting(indent, :opening)
  end

  def close(indent)
    html_formatting(indent, :closing)
  end

  def html_formatting(indent, open_or_close)
    if indent == 0
      html_element("p", open_or_close)
    else
      html_element("blockquote", open_or_close) * indent
    end
  end

  def html_element(name, open_or_close)
    "<#{open_or_close == :closing ? "/" : ""}#{name}>"
  end
```

`format_line` is clearly a hack that won’t survive because we know we have different rules around blank lines or adjacent verse lines, but we can write another failing test to drive that out.  The rest of the code does show that we can correctly generate the right html tags around an individual line.  And the first test still passes because

```ruby
[].join("") => ""
```

### Formatting Groups of Lines

So, let's break it with blank lines and adjacent verse lines, shall we?

```ruby
  context "blank lines and verse lines" do
    it "copes" do
      f = HtmlFormatter.new(Entry.new([Line.new("start"),
                                       Line.new(""),
                                       Line.new("v1 l1"),
                                       Line.new("v1 l2"),
                                       Line.new(""),
                                       Line.new("v2 l1"),
                                       Line.new("v2 l2")]))
      expect(f.format).to eq("<p>start</p>" +
                             "<p>v1 l1<br/>v1 l2</p>" +
                             "<p>v2 l1<br/>v2 l2</p>")
    end
  end
```

This fails with

```ruby
expected: "<p>start</p><p>v1 l1<br/>v1 l2</p><p>v2 l1<br/>v2 l2</p>"
got: "<p>start</p><p></p><p>v1 l1</p><p>v1 l2</p><p></p><p>v2 l1</p><p>v2 l2</p>"
```

It feels as though the simplest thing we could add to make this work is the concept of groups of adjacent lines at the same indent level.  If we could ask the Entry not for its Lines but for its groups of Lines at the same indent level (call them Paragraphs?), the formatting problem becomes much simpler.  Let’s write the formatting code that would work if we had that:

```ruby
  def format
    @entry.paragraphs.collect { |para| format_paragraph(para) }.join("")
  end

  private

  def format_paragraph(lines)
    indent = lines.first.indent
    "#{open(indent)}#{para_contents(lines)}#{close(indent)}"
  end

  def para_contents(lines)
    lines.collect(&:text).join("<br/>")
  end
```

This of course makes all the tests fail because Entry doesn’t have a `#paragraphs` method.  Let’s start adding it, at least to fix the first four tests, and remove `attr_accessor :lines` because we no longer need to expose it externally:

```ruby
  def paragraphs
    case @lines.count
    when 0
      []
    when 1
      [@lines]
    else
      # TODO: Implement
    end
  end
```

This is writing code that is indirectly tested, which feels a little dirty, but it’s pretty simple and gets us back to only the new test failing.  For the TODO line though, let’s drop down to unit level tests on Entry, and start by adding the two cases we’re already assuming:

```ruby
# spec/entry_spec.rb
require_relative "../lib/entry"
require_relative "../lib/line"

RSpec.describe Entry, "#paragraphs" do
  context "empty" do
    it "returns []" do
      entry = Entry.new([])
      expect(entry.paragraphs).to eq([])
    end
  end
  context "one line" do
    it "returns [[one_line]]" do
      one_line = Line.new("one_line")
      entry = Entry.new([one_line])
      expect(entry.paragraphs).to eq([[one_line]])
    end
  end
end
```

Now then.  Suppose we’ve got a line, an empty line, two lines, an empty line, and a line.  We’ll expect three paragraphs.

```ruby
  context "three paras" do
    it "returns three paras" do
      first = [Line.new("first")]
      middle = [Line.new("middle 1"), Line.new("middle 2")]
      last = [Line.new("last")]
      blank = Line.new("")
      entry = Entry.new([first, blank, middle, blank, last].flatten)
      expect(entry.paragraphs).to eq([first, middle, last])
    end
  end
```

The simplest thing is to split on (start a new paragraph for) blank lines:

```ruby
  def paragraphs
    case @lines.count
    when 0
      []
    when 1
      [@lines]
    else
      reckon_paragraphs
    end
  end

  def reckon_paragraphs
    [[@lines.first]].tap do |paras|
      @lines[1..-1].each do |line|
        if line.text == ""
          paras << []
        else
          paras.last << line
        end
      end
    end
  end
```

This makes our EntrySpec pass, and if we go back out to our HtmlFormatterSpec, that passes too.

We’ve tested formatting and paragraphing independently, let’s test them both at once:

```ruby
  context "paragraphs and indent" do
    it "copes" do
      f = HtmlFormatter.new(Entry.new([Line.new("That line from that play"),
                                     Line.new(""),
                                     Line.new(1, "CAESAR"),
                                     Line.new(""),
                                     Line.new(2, "until the gods are tired of blood and create a race that can understand.")]))

      expect(f.format).to eq("<p>That line from that play</p>" +
                             "<blockquote>CAESAR</blockquote>" +
                             "<blockquote><blockquote>until the gods are tired of blood and create a race that can understand.</blockquote></blockquote>")
    end
  end
```

That passes too, so let’s run them all, they all pass, and leave it for now.
