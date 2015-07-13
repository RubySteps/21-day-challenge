# 004/06

Going back to the end of day 4, if we’re passing in the result of a textarea, the next thing we need is code that translates params[:textarea] into an Entry.

## Trying out the UI for Input

However, I’m not sure yet what I want the rules for the input from the textarea to be.  For instance, if you’re using “> ” for indent and you’re citing verse in stanzas, does it have to look like

```
> E quella a me: “Nessun maggior dolore
> che ricordarsi del tempo felice
> ne la miseria; e ciò sa ’l tuo dottore.

> Ma s’a conoscer la prima radice
```

or, once you set an indent level, can you assume that it continues until the next blank like, or until a change of indent level, in which case you could have instead:

```
> E quella a me: “Nessun maggior dolore
che ricordarsi del tempo felice
ne la miseria; e ciò sa ’l tuo dottore.

> Ma s’a conoscer la prima radice
```

A quick experiment with a rails app shows that

```ruby
params[:textarea].split("\r\n")
```

will return us an array of line strings, and that a long prose line which wraps is still just a single line.

Also, playing around with entering text, it feels much more convenient not to add the extra indent symbols, so let’s assume we need the code to carry the previous indent until the next blank line.

Going back to entering the bits of Macbeth from day 1 –

```
> LENNOX
> > Sent he to Macduff?

> LORD
> > He did: and with an absolute 'Sir, not I,’
The cloudy messenger turns me his back,
And hums, as who should say 'You'll rue the time
That clogs me with this answer.’
```

– let’s refine that to assume the code should carry the previous indent until the next blank line or a change in the indent level.

Having figured that, we can leave the rails app to one side (we can always bring it back if we have further uncertainties about how we want the UI to feel), and concentrate on the narrower problem of converting an array of strings into an Entry.

## Back to Building an Entry

Bringing forward the code from day 2 with the `lib/html_formatter`, we can add a `lib/entry_builder` in the same way, and starting with a `spec/entry_builder_spec` using the test data we just came up with while trying out the UI.

(In a real application, might this code end up in an `Entry.build_from_raw_input(params)` factory method?  Sure.  Could we put it there from the beginning?  Yes.  But part of my thought-experiment here is to build small isolated well-tested blocks with as few assumptions as possible.  We don’t yet know how the rest of the system will work, so we’re deferring that decision for now.)

First test case, then?

```ruby
# spec/entry_builder_spec.rb
# -*- coding: utf-8 -*-
require_relative "../lib/entry_builder"
require_relative "../lib/entry"
require_relative "../lib/line"

RSpec.describe EntryBuilder, "#build" do
  context "single indent level" do
    it "returns Dante entry" do
      raw = ["> E quella a me: “Nessun maggior dolore",
             "che ricordarsi del tempo felice",
             "ne la miseria; e ciò sa ’l tuo dottore.",
             "",
             "> Ma s’a conoscer la prima radice"]
      expected = Entry.new([Line.new(1, "E quella a me: “Nessun maggior dolore"),
      Line.new(1, "che ricordarsi del tempo felice"),
      Line.new(1, "ne la miseria; e ciò sa ’l tuo dottore."),
      Line.new(""),
      Line.new(1, "Ma s’a conoscer la prima radice")])
      b = EntryBuilder.new(raw)
      expect(b.build).to eq(expected)
    end
  end
end
```

and the simplest thing that could get that to a place where the bits where it isn’t passing are interesting:

```ruby
# lib/entry_builder.rb
class EntryBuilder
  def initialize(raw_lines)
    @raw_lines = raw_lines
  end

  def build
    Entry.new(@raw_lines.collect { |l| Line.new(l) })
  end
end
```

This results in

```ruby
       expected: #<Entry:0x007fb831c48128 @lines=[#<Line:0x007fb831c48ab0 @indent=1, @text="E quella a me: “Nessun maggior dolore">, #<Line:0x007fb831c48920 @indent=1, @text="che ricordarsi del tempo felice">, #<Line:0x007fb831c487e0 @indent=1, @text="ne la miseria; e ciò sa ’l tuo dottore.">, #<Line:0x007fb831c481f0 @indent=0, @text="">, #<Line:0x007fb831c48178 @indent=1, @text="Ma s’a conoscer la prima radice">]>
       got: #<Entry:0x007fb831c4be90 @lines=[#<Line:0x007fb831c4bfa8 @indent=0, @text="> E quella a me: “Nessun maggior dolore">, #<Line:0x007fb831c4bf30 @indent=0, @text="che ricordarsi del tempo felice">, #<Line:0x007fb831c4bf08 @indent=0, @text="ne la miseria; e ciò sa ’l tuo dottore.">, #<Line:0x007fb831c4bee0 @indent=0, @text="">, #<Line:0x007fb831c4beb8 @indent=0, @text="> Ma s’a conoscer la prima radice">]>
```

and tells us two things: we aren’t handling indent levels at all (and we knew that), and we need a better test for the contents of an entry.  We can brute-force the latter for now by replacing `expect(b.build).to eq(expected)` in the test with a link to a new method that goes through the lines and compares the fields we care about:

```ruby
lines_match(expected, b.build)

def lines_match(expected, actual)
  expect(actual.lines.count).to eq(expected.lines.count)
  actual.lines.zip(expected.lines).each do |actual_line, expected_line|
    expect(actual_line.indent).to eq(expected_line.indent)
    expect(actual_line.text).to eq(expected_line.text)
  end
end
```

and the quickest way of checking that that works is to add a test without indenting, which passes:

```ruby
context "no indent" do
  it "returns unindented" do
    raw = ["E quella a me: “Nessun maggior dolore",
           "che ricordarsi del tempo felice",
           "ne la miseria; e ciò sa ’l tuo dottore.",
           "",
           "Ma s’a conoscer la prima radice"]
    expected = Entry.new([Line.new("E quella a me: “Nessun maggior dolore"),
    Line.new("che ricordarsi del tempo felice"),
    Line.new("ne la miseria; e ciò sa ’l tuo dottore."),
    Line.new(""),
    Line.new("Ma s’a conoscer la prima radice")])
      b = EntryBuilder.new(raw)
    lines_match(expected, b.build)
  end
end
```

So, back to the failing test with indents.  Here, we need to strip of (any number of) leading “> ”, and convert them to the indent level until a blank line is reached.  (Yes, we’ll add another failing test after this to handle the indent level changing without an intervening blank line case.)  There are two steps to this: getting the indent without needing to care about preserving the indent for subsequent lines, and getting the indent and preserving it for subsequent lines.  Let’s add a test that fails for the first case:

```ruby
context "single indent level, but not multiple lines" do
  it "returns Dante entry" do
    raw = ["> E quella a me: “Nessun maggior dolore",
           "",
           "> Ma s’a conoscer la prima radice"]
    expected = Entry.new([Line.new(1, "E quella a me: “Nessun maggior dolore"),
    Line.new(""),
    Line.new(1, "Ma s’a conoscer la prima radice")])
    b = EntryBuilder.new(raw)
    lines_match(expected, b.build)
  end
end
```

and get it to pass like so:

```ruby
def build
  Entry.new(@raw_lines.collect { |l| Line.new(*line_indent_and_text(l)) })
end

def line_indent_and_text(raw_line)
  c = raw_line.split("> ")
  return [0, ""] if c.size == 0
  [c.length - 1, c.last]
end
```

This leaves us the original `context "single indent level"` test failing.

This can be made to pass in an ugly down-to-the-wire fashion like so:

```ruby
def build
  Entry.new(build_lines)
end

def build_lines
  lines = [Line.new(*line_indent_and_text(@raw_lines[0]))]
  @raw_lines[1..-1].each do |raw_line|
    new_line = Line.new(*line_indent_and_text(raw_line))
    last_indent = lines.last.indent
    if new_line.indent == 0 && new_line.text != ""
      new_line.indent = last_indent
    end
    lines << new_line
  end
  lines
end
```

… but the `build_lines` method is crying out to be refactored to within an inch of its life.  They don’t call it red, green, refactor for nothing.
