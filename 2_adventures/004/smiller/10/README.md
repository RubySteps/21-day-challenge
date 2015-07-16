# 004-10

## But with World Enough, and Time…

There are two more things I’d like to do here.  One is write a unit test for `Entry#paragraphs`, so we’re testing at the level of the `#paragraphs` method (and not of the method `#paragraphs` is outputting to) that it doesn’t blow up on a second blank line.  Second is add a test to `EntryBuilder#build` to make sure it doesn’t pass through the second empty blank line to start with.

So:

```ruby
# spec/entry_spec.rb
context "two paras with two blank lines" do
  it "returns two paras" do
    first = [Line.new("mind the gap...")]
    blank = Line.new("")
    second = [Line.new("... safely stowed")]
    entry = Entry.new([first, blank, blank, second].flatten)
    expect(entry.paragraphs).to eq([first, second])
  end
end
```

This works, but raises the next question, what if the entry starts or ends with one or more blank lines?

```ruby
context "blanks at beginning" do
  context "two" do
    it "returns one para" do
      blank = Line.new("")
      second = [Line.new("... safely stowed")]
      entry = Entry.new([blank, blank, second].flatten)
      expect(entry.paragraphs).to eq([second])
    end
  end
  context "one" do
    it "returns one para" do
      blank = Line.new("")
      second = [Line.new("... safely stowed")]
      entry = Entry.new([blank, second].flatten)
      expect(entry.paragraphs).to eq([second])
    end
  end
end
context "blanks at end" do
  context "one" do
    it "returns one para" do
      first = [Line.new("mind the gap...")]
      blank = Line.new("")
      entry = Entry.new([first, blank].flatten)
      expect(entry.paragraphs).to eq([first])
    end
  end
  context "two" do
    it "returns one para" do
      first = [Line.new("mind the gap...")]
      blank = Line.new("")
      entry = Entry.new([first, blank, blank].flatten)
      expect(entry.paragraphs).to eq([first])
    end
  end
end
```

The blanks at beginning checks already pass, coincidentally, because `#second_blank_line` will return true for any number of initial blank lines (because, for the first one, `result.last` is the outer empty array).  The blanks at end check fail.  It feels like it would be better (and not rely on a side-effect of `#second_blank_line`) to explicitly trim leading and trailing blank lines.  This works as a first pass:

```ruby
def paragraphs
  return [] if @lines.count == 0
  lines_trimmed.inject([[]]) do |result, line|
    build_next_result(result, line)
  end
end

private

def lines_trimmed
  trimmed = trim_initial_blank_lines(@lines)
  trim_initial_blank_lines(trimmed.reverse).reverse
end

def trim_initial_blank_lines(lines)
  lines.each_with_index do |l, index|
    next if l.text == ""
    return lines[index..-1]
  end
end
```

Looking at the implementation for Ruby’s [`String#split`](http://ruby-doc.org/core-2.2.0/String.html#method-i-strip) (which is what we want here, except for objects, not characters), we see that it grabs the left and right offsets and returns the substring:

```ruby
loffset = lstrip_offset(str, start, start+olen, enc);
roffset = rstrip_offset(str, start+loffset, start+olen, enc);

if (loffset <= 0 && roffset <= 0) return rb_str_dup(str);
return rb_str_subseq(str, loffset, olen-loffset-roffset);
```

We can do that instead:

```ruby
def lines_trimmed
  start = first_non_blank_index(@lines)
  finish = first_non_blank_index(@lines.reverse)
  @lines[start..-(finish + 1)]
end

def first_non_blank_index(lines)
  lines.each_with_index do |l, index|
    return index if l.text != ""
  end
end
```

The tests still pass, and it feels better.
