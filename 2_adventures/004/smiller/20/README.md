# 004/20

More from [smiller/extracts](https://github.com/smiller/extracts)

We can get that to work with

```ruby
def citations
matches = extract.scan(/\n(From.*?:)\n\n(.*?)\n\n[^\s]/m)
if matches
matches.map { |m| {header: m[0], text: m[1].gsub(/    /, “”) } }
end
end
```

Though in experimenting with that we suspect that a blank line within the
citation would still break it, so that sounds like the next test to add.

Let’s change our source data:

```
From J. R. R. Tolkien, /Tree and Leaf/, 25:

more quoted stuff
on multiple lines

with line breaks between
```

and our test:

```ruby
{
header: “From J. R. R. Tolkien, /Tree and Leaf/, 25:”,
text: “more quoted stuff\non multiple lines\n\nwith line breaks between”}
```

we see, as expected, the line break foxes it:

```ruby
-  :text=>”more quoted stuff\non multiple lines”}]
+  :text=>”more quoted stuff\non multiple lines\n\nwith line breaks between”}]
```

Something that gets the multi-line extract with line breaks test green, though it feels horribly convoluted, is:

```ruby
def citations
  citing = false
  extract.split("\n").inject([]) do |citations, line|
    if line =~ /From.*:/
      citations << { header: line, text: [] }
      citing = true
    elsif citing
      if line == "" || line =~ /\A    /
        citations.last[:text] << line.sub(/\A    /, "")
      else
        citations.last[:text] = citations.last[:text][1..-2].join("\n")
        citing = false
      end
    end
    citations
  end
end
```

It can be made somewhat easier to read by extracting methods so that the long main method is at a higher level of abstraction:

```ruby
def citations
  citing = false
  extract.split("\n").inject([]) do |citations, line|
    if header_line?(line)
      citations, citing = process_header_line(citations, line)
    elsif citing
      if citation_line?(line)
        citations, citing = process_citation_line(citations, line)
      else
        citations, citing = finish_citation(citations)
      end
    end
    citations
  end
end

def header_line?(line)
  line =~ /From.*:/
end

def process_header_line(citations, line)
  citations << { header: line, text: [] }
  [citations, true]
end

def citation_line?(line)
  line == "" || line =~ /\A    /
end

def process_citation_line(citations, line)
  citations.last[:text] << line.sub(/\A    /, "")
  [citations, true]
end

def finish_citation(citations)
  citations.last[:text] = citations.last[:text][1..-2].join("\n")
  [citations, false]
end
```

But it still feels as though there’s a better way that I’m missing here.  Let’s put it aside for now.
