How easy would it be to extend a cucumber html formatter to take

    #+IMAGE ./img/page-01.tiff
    #+LINK https://optoro.atlassian.net/browse/OT-6134

and turn them into images and links embedded in the report?

See [custom formatters](https://github.com/cucumber/cucumber/wiki/Custom-Formatters)

Also [cucumber html formatter](https://github.com/cucumber/cucumber/blob/master/lib/cucumber/formatter/html.rb)

~

The story so far handles comments outside of scenarios.  Comments inside of
scenarios are ignored.  It would be nice if they could be recognized, but
they’re not showing up in the console-formatted cucumber output either, so
that’s probably happening at an earlier point.
