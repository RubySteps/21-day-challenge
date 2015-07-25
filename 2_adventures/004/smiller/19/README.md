# 004/19

Adds to (smiller/extracts)[https://github.com/smiller/extracts]:

We have our first extract-an-entry test, and a second rewrite-the-file-adding-a-footnote-to-a-citation test.  It feels like we missed a step, which is identify-a-citation-in-an-entry.

The entry, again, is:

```
*** Monday 20 July 2015

relevant stuff

From C. S. Lewis, /The Four Loves/, 162:

    quoted stuff

more relevant stuff

```

So we want to be able to extract as a citation anything preceeded by a line that starts “From” and ends “:”, and is then either empty lines or indented lines.  Given that there might be multiple citations in an entry, we will want a subsequent test to ensure it handles multiple citations, but let’s go with this for now.

In the simplest case, a citation has a header and the text, so we could have a test:

```ruby
it “extracts citations” do
  p = Processor.new(“spec/fixtures/2015.org”, “*** Monday 20 July 2015”, “*** Tuesday 21 July 2015”)
  expect(p.citations.first).to eq({header: “From C. S. Lewis, /The Four Loves/, 162:”, text: “quoted stuff”})
end
```

Run that (`C-c , c` to run it in-editor with rspec-mode), it fails because there’s no method `#citations`, so we’ll add one.

Code that gets just this test passing is as simple as:

```ruby
def citations
  matches = (/\n(From[^\n]*:)\n\n(.*)\n\n[^\n| ]/).match(extract)
  if matches
    [{header: matches[1], text: matches[2].sub(/\A    /, “”)}]
  end
end
```

but it will obviously break the moment there are two citations, so let’s add that next.  Include another entry in `spec/fixtures/2015.org`:

```
*** Tuesday 21 July 2015

relevant stuff

From C. S. Lewis, /The Four Loves/, 162:

    quoted stuff

more relevant stuff

From J. R. R. Tolkien, /Tree and Leaf/, 25:

	more quoted stuff
	on multiple lines

closing relevant stuff

*** Wednesday 22 July 2015
```

And add the failing spec:

```ruby
it "extracts multiple" do
  p = Processor.new("spec/fixtures/2015.org", "*** Tuesday 21 July 2015", "*** Wednesday 22 July 2015")
  expect(p.citations)
    .to eq([
            {
             header: "From C. S. Lewis, /The Four Loves/, 162:",
             text: "quoted stuff"},
            {
             header: "From J. R. R. Tolkien, /Tree and Leaf/, 25:",
             text: "more quoted stuff\non multiple lines"}
           ])
end
```
