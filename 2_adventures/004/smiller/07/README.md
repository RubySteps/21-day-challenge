# 004-07

Now that I’m carrying code over for a third day, time to consult the [long-running projects](https://github.com/RubySteps/21-day-challenge/wiki/Long-Running-Projects) advice and move it to a separate [project](https://github.com/smiller/entries).

Two things left over from 004/06:

- Refactor the `build_lines` method
- Add another test in EntryBuilderSpec for the Macbeth quotation

And a possible third:

- Look for a more elegant way of handling the `lines_match` check.  Note also that the error messaging is cryptic.  Maybe add a custom matcher? (see earlier [here](http://thewanderingcoder.com/2015/06/testing-with-page-objects-setup/#sec-4-1))

## Refactor `build_lines`

Starting from:

```ruby
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

We can get rid of the last line returning `lines` return with `tap`:

```ruby
def build_lines
  [Line.new(*line_indent_and_text(@raw_lines[0]))].tap do |lines|
    @raw_lines[1..-1].each do |raw_line|
      new_line = Line.new(*line_indent_and_text(raw_line))
      last_indent = lines.last.indent
      if new_line.indent == 0 && new_line.text != ""
        new_line.indent = last_indent
      end
      lines << new_line
    end
  end
end
```

Since `line_indent_and_text` is only called as an argument to `Line.new`, we can rename it and get it to return the new line:

```ruby
def build_lines
  [line_from_raw(@raw_lines[0])].tap do |lines|
    @raw_lines[1..-1].each do |raw_line|
      new_line = line_from_raw(raw_line)
      last_indent = lines.last.indent
      if new_line.indent == 0 && new_line.text != ""
        new_line.indent = last_indent
      end
      lines << new_line
    end
  end
end

def line_from_raw(raw_line)
  c = raw_line.split("> ")
  return Line.new("") if c.size == 0
  Line.new(c.length - 1, c.last)
end
```

And since changing the indent is part of creating the new line we can push all of that down to the `line_from_raw` method as well, at which point we no longer have a name collision and can call it `new_line`:

```ruby
def build_lines
  [new_line(@raw_lines[0])].tap do |lines|
    @raw_lines[1..-1].each do |raw_line|
      lines << new_line(raw_line, lines.last.indent)
    end
  end
end

def new_line(raw_line, last_indent = 0)
  c = raw_line.split("> ")
  return Line.new("") if c.size == 0
  Line.new(c.length - 1, c.last).tap do |line|
    line.indent = last_indent if line.indent == 0
  end
end
```

We’ve taken a ten-line method and replaced it with two five-line methods, but it feels easier to take in at a glance and reason about.  (Also, there is no way I would have wanted to do that without having tests to run between each step.)

We can even take it one further, since the `new_line` method feels like it’s doing two separate things, unbalancedly, and split out the new indent calculation:

```ruby
def build_lines
  [new_line(@raw_lines[0])].tap do |lines|
    @raw_lines[1..-1].each do |raw_line|
      lines << new_line(raw_line, lines.last.indent)
    end
  end
end

def new_line(raw_line, last_indent = 0)
  c = raw_line.split("> ")
  return Line.new("") if c.size == 0
  Line.new(new_indent(c.length - 1, last_indent), c.last)
end

def new_indent(current, previous)
  current == 0 ? previous : current
end
```

## On Sandi Metz’s Rules

The result of the refactoring happens to follow the Sandi Metz [rule](https://robots.thoughtbot.com/sandi-metz-rules-for-developers) that there should be no more than five lines per method.  I really like the result.  There is (of course) a [gem](https://github.com/makaroni4/sandi_meter) that monitors compliance with the rules.  If we add it and run it from the command line, we see:

```
1. 100% of classes are under 100 lines.
2. 83% of methods are under 5 lines.
3. 100% of method calls accepted are less than 4 parameters.
4. No controllers to analyze.

Methods with 5+ lines
  Class name  | Method name        | Size  | Path
  Entry       | paragraphs         | 8     | ./lib/entry.rb
  Entry       | reckon_paragraphs  | 9     | ./lib/entry.rb
```

Let’s have a look at the two exceptions:

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

Hmm.  Are we bothered?  Looking at it, we see we can replace it with:

```ruby
def paragraphs
  @lines.count == 0 ? [] : build_paragraphs
end

def build_paragraphs
  [[@lines.first]].tap do |paras|
    @lines[1..-1].each do |line|
      paras = add_line(paras, line)
    end
  end
end

def add_line(paras, line)
  paras.tap do |p|
    line.text == "" ? p << [] : p.last << line
  end
end
```

This shows us between `entry#build_paragraphs` and `entry_builder#build_lines` we have a common pattern of

```
[{first element of collection}].tap do |result|
  {iterate over rest of collection} do |element|
    result << do_something_with(element)
  end
end
```

And one wonders if both methods could be simplified to use `#inject` instead.  Hmm.

## Rebuilding `build_` methods with `#inject`

The short answer for `build_paragraph` is yes, we can:

```ruby
def paragraphs
  return [] if @lines.count == 0
  @lines.inject([[]]) do |result, line|
    line.text == "" ? result << [] : result.last << line
    result
  end
end
```

Though the guard clause for returning [] on a zero-count suggests an inconsistency, in that if whatever the consuming code is accepted [[]] instead, we wouldn’t need the guard clause.  Let’s just add that to our notional list:

- Add another test in EntryBuilderSpec for the Macbeth quotation
- Look for a more elegant way of handling the `lines_match` check
- See whether `#paragraph`’s calling code could take [[]] for no paras?

and look at `build_lines` for now.  We can use `#inject` there too:

```ruby
def build_lines
  @raw_lines.inject([]) do |result, raw_line|
    result << new_line(raw_line, result.last ? result.last.indent : 0)
    result
  end
end
```

though it feels like it would be cleaner to extract the ternary operator to get the previous indent (provided there was a previous line) to a separate method:

```ruby
def build_lines
  @raw_lines.inject([]) do |result, raw_line|
    result << new_line(raw_line, previous_indent(result))
    result
  end
end

def previous_indent(result)
  result.last ? result.last.indent : 0
end
```

(We can also get rid of the default 0 value of last_indent in the `new_line(raw_line, last_indent = 0)` method because we’re setting it explicitly now and everything below `build` should be a private method in any case.  (The same would be the case for everything under `paragraphs` in entry, but after using `#inject` there are no other methods left.)

In both cases the `#inject` code is slightly more complicated than it would be out of the box (I’m not terribly happy with the `([[]])` in `paragraphs`) because we’re relying on the previous element to build the current element, which is why we started with the `elements[0] … elements[1..-1]` structure, but in both cases, using the standard `#inject` feels a better approach.
