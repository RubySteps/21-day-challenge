# 004/04

## What’s Next

We don’t actually need to persist at this point.  We could just build a Lotus app that lets you type an Entry in a textarea, press a preview button, and then displays the result.

Eventually we’ll want persistence, full text search, proper navigating, possibly a javascript framework front-end that updates a html-formatted preview in real time (which would involve reimplementing the html formatting in the front end), but for now, let’s just get a UI and verify that typing the entry into a textarea works how we would like, since that’s the most user-facing bit of functionality.

So let’s start up (following http://lotusrb.org/ and http://lotusrb.org/guides/getting-started/):

```
gem install lotusrb
lotus new entries --database=postgres --test=rspec
cd entries && bundle
bundle exec lotus server
```
