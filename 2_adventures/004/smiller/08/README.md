# 13/14 July 2015 (004-08)

The latest next things list:

- Add another test in EntryBuilderSpec for the Macbeth quotation
- Look for a more elegant way of handling the `lines_match` check
- See whether `#paragraph`’s calling code could take [[]] for no paras?

## Multiple indent levels test

So let’s add a test for the multiple indent levels of the Macbeth quotations:

```ruby
context "multiple indent levels" do
  it "returns Macbeth entry" do
    raw = ["> LENNOX" +
           "> > Sent he to Macduff?" +
           "" +
           "> LORD" +
           "> > He did: and with an absolute 'Sir, not I,’" +
           "The cloudy messenger turns me his back," +
           "And hums, as who should say 'You'll rue the time" +
           "That clogs me with this answer.’"]
    expected = Entry.new([Line.new(1, "LENNOX"),
    Line.new(2, "Sent he to Macduff?"),
    Line.new(""),
    Line.new(1, "LORD"),
    Line.new(2, "He did: and with an absolute 'Sir, not I,’"),
    Line.new(2, "The cloudy messenger turns me his back,"),
    Line.new(2, "And hums, as who should say 'You'll rue the time"),
    Line.new(2, "That clogs me with this answer.’")])
      b = EntryBuilder.new(raw)
    lines_match(expected, b.build)
  end
end
```

And that passes.  Initially suspicious, because we haven’t changed any code yet, but looking at `entry_builder#new_indent` we only over-ride the indent when the current indent is 0, so for a changed non-zero indent it would naturally use the new value.

Though that does beg the question, what happens if there’s a non-blank zero-indent line after an indented line.  It would count as an equally-indented line.  But that isn’t allowed to happen because of the UI decision from day 6, otherwise we would need to write

```
> E quella a me: “Nessun maggior dolore
> che ricordarsi del tempo felice
> ne la miseria; e ciò sa ’l tuo dottore.
```

instead of

```
> E quella a me: “Nessun maggior dolore
che ricordarsi del tempo felice
ne la miseria; e ciò sa ’l tuo dottore.
```

So we’re probably good for the EntryBuilder at this point.  What’s next?

## Hmm.  What _Is_ Next?

So we’ve effectively got `#from_textarea` and `#to_html` methods for Entries, though not currently on Entry proper.  If we allow UI editing of Entries we will presumably want a `#to_textarea` method as well.  If we want to allow for exporting the data into an externally-readable format, we might want `#to_markdown` as well, which would produce something similar to the textarea except any line without a following blank line would be treated as a line to break on and have two spaces after the end of the line ([q.v.](http://daringfireball.net/projects/markdown/syntax#block)), and blockquoting for verse lines (though not paragraph lines) would require the indent symbol in front of every line ([q.v.](http://daringfireball.net/projects/markdown/syntax#blockquote)).

Those both sound worth doing, but in the back of my mind there’s still the (presumably more javascript-heavy) idea of having the input turn to html on-the-fly, so the input feels something more like 750words.com.  In which case working on `#to_textarea` is not the next obvious step.

Continuing to ponder…
