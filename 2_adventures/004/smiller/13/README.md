# 004/13

## Fix leftover failing tests

The simplest fix to those is:

```
# lib/entry.rb
def paragraphs
  return [] if @lines.count == 0
  trimmed(@lines).inject([[]]) do |result, line|
    add_line_to_paragraphs(result, line)
  end
end

private

def add_line_to_paragraphs(result, line)
  return (result << []) if line.empty?
  return (result << [line]) if indent_changed?(line, result)
  result.last << line
  result
end

def indent_changed?(line, result)
  return false if result.last.empty?
  line.indent > 0 && (line.indent != result.last.last.indent)
end
```

After which, copying the revised files into entries-rails,

```
> LENNOX
> > Sent he to Macduff?

> LORD
> > He did: and with an absolute ‘Sir, not I,’
The cloudy messenger turns me his back,
And hums, as who should say ‘You’ll rue the time
That clogs me with this answer.’
```

works in the preview as expected.
