# Day 10

I improved yesterday's work, the search for courses in a Rails app. The search only considered the full title and I added a named scope that uses Arel's `matches`. The search query is sanitized by `sanitize_sql_like` to make sure no SQL injection is possible. I added a test case for this as well. Next up will be adding test cases for the search itself and being able to search on multiple attributes, e.g. within the title and the location.

See the other files in this directory for sample code.

## Links

* `searchlight` [on GitHub](https://github.com/nathanl/searchlight)