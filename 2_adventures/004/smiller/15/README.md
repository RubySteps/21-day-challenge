# 004/15

Take a file (say `2015.org`), and a beginning point (say `*** Monday 20 July 2015`) and an end point (say `*** Tuesday 21 July 2015`) and find all the citations (lines starting `From` and ending with a colon?) and copy them off into separate “autrui” files.  With CUSTOM_IDs so they can be linked to later, obviously.  And actually, links back to the “gesta” file from the “autrui” file would be good too.

This kind of cheats and lets me keep org-mode files but with automatic linking.

Hmm.  And in theory there could be a separate “week” file with highlights and links to sub-entries and a separate “month” file with highlights and links to sub-entries (weeks, conceivably followed by days) – or are those all new inserted sections in an existing “year” file?  Links can be to the top of a new short “day” file or to a header in an existing “year” file.  Given links and bookmarks, you can get random access either way.

Hmm.  Ruby or Elisp?  Do it in Ruby first because I can probably do that more quickly, then consider an alternate version?

So.  Simplest test setup:

```ruby
# 2015.org
earlier stuff

*** Monday 20 July 2015

relevant stuff

From C. S. Lewis, /The Four Loves/, 162:

    quoted stuff

more relevant stuff

*** Tuesday 21 July 2015

later stuff
```

Given the file, the start and end points, make sure that we can:
- grab the relevant entry
- parse out the From: line and create a new file for it
  - there will definitely be formatting issues, indenting and prose lines and verse lines: add more tests later to deal with these
  - also, what if you quote the same work again, and there’ll be intercalating issues with where you put the snippet in the extracted file?  Sorting issues.  More tests later for that too.
  - extra marks for including a link in this extracted file back to the original file
- put back the text into the file, including a link to the newly-added file
- make sure you can read the file as before

We now know what the first (and some of the later) tests will be.  We have a plan!
