# 004/12

A possible next step would be to start introducing markdown-like formatting to Lines, so `_italic_` and `**bold**` show as _italic_ and **bold**.  Though this starts to beg the question that this has been well done before ([here](https://markdown-it.github.io/) and [here](http://jbt.github.io/markdown-editor/)), and to wonder whether I am prepared to reinvent the wheel just to avoid having to put two spaces at the end of a line to indicate it should have a line break, or not have to put indentation indications for, say, the second, third, and fourth lines of a quatrain.

The “Entries” format:

```
> LENNOX
> > Sent he to Macduff?

> LORD
> > He did: and with an absolute ‘Sir, not I,’
The cloudy messenger turns me his back,
And hums, as who should say ‘You’ll rue the time
That clogs me with this answer.’
```

The Markdown format, using _ for “final trailing space”:

```
> LENNOX
> > Sent he to Macduff?
>
> LORD
> > He did: and with an absolute 'Sir, not I,’__
> > The cloudy messenger turns me his back,__
> > And hums, as who should say 'You'll rue the time__
> > That clogs me with this answer.’
```

There’s no harm in doing it as a learning experience, and I could put in bits of Emacs’ typopunct-mode to interpret non-code-blocked quotes as smart quotes and ellipses and en- and em-dashes.

And I could make it understand line numbering of verse, so I could make a new type of Line which is a cross-reference to, say, lines 18-36 of Denise Levertov’s _The Secret_, and have it import those into the current entry.

And the thing that that would do that merely pasting it in a markdown document would not is preserve the fact of the cross-reference.  But you could get that cross-reference (not automatically, but still fairly easily) by copying in the text and tagging the Entry, as well.

Sounds like time for an experiment.  And since we’ve got the [entries-rails](https://github.com/smiller/entries-rails) project doing a preview of textarea-to-html for the “Entries” format, why not split the screen, grab the [redcarpet](https://github.com/vmg/redcarpet) gem, and do a split screen with the top half using “Entries” and the bottom half using Markdown, and experiment with both projects.

(We note in passing while we’re doing that that entries-rails did not have the most up-to-date version of the entries code, and if the entries / entries-rails relationship were expected to exist much longer, we would probably put entries into a gem and include it that way.)

… experiments ensue …

I found it surprisingly irritating and unintuitive to put the two spaces at the end of something that I wanted to be a line, which is why I started to build the new format in the first place.  I also discovered that there was a missing test in `entries`:

```
> LENNOX

> > Sent he to Macduff?

> LORD

> > He did: and with an absolute ‘Sir, not I,’
The cloudy messenger turns me his back,
And hums, as who should say ‘You’ll rue the time
That clogs me with this answer.’
```

worked as I expected it to, but

```
> LENNOX
> > Sent he to Macduff?

> LORD
> > He did: and with an absolute ‘Sir, not I,’
The cloudy messenger turns me his back,
And hums, as who should say ‘You’ll rue the time
That clogs me with this answer.’
```

did not: “LENNOX” and “Sent he to Macduff?” were on the same line.  I thought I had done something about that, but clearly I hadn’t.  We can add failing specs:

```ruby
# spec/entry_spec.rb
context "changing indent changes paragraph" do
  it "returns two paras" do
    first = [Line.new(1, "LENNOX")]
    second = [Line.new(2, "Sent he to Macduff?")]
    entry = Entry.new([first, second].flatten)
    expect(entry.paragraphs).to eq([first, second])
  end
end
```

```ruby
# spec/html_formatter_spec.rb
context "Macbeth changing indent" do
  it "copes" do
    f = HtmlFormatter.new(Entry.new([Line.new(1, "LENNOX"),
                                     Line.new(2, "Sent he to Macduff?")]))
    expect(f.format).to eq("<blockquote>LENNOX</blockquote><blockquote><blockquote>Sent he to Macduff?</blockquote></blockquote>")
  end
end
```

And with five minutes to go, we’ll pause there.
