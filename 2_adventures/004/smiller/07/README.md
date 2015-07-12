# 004/07

Now that I’m carrying code over for a third day, time to consult the [long-running projects](https://github.com/RubySteps/21-day-challenge/wiki/Long-Running-Projects) advice and move it to a separate [project](https://github.com/smiller/entries).

Two things left over from 004/06:

- Refactor the `build_lines` method
- Add another test in EntryBuilderSpec for the Macbeth quotation

And a possible third:

- Look for a more elegant way of handling the `lines_match` check.  Note also that the error messaging is cryptic.  Maybe add a custom matcher? (see earlier [here](http://thewanderingcoder.com/2015/06/testing-with-page-objects-setup/#sec-4-1))
