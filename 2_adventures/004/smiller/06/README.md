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
