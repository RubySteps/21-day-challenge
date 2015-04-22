# Day 9

For a Rails app I'm working on I had to add a simple search on one of it's models. The user should be able to search for courses by name and category and in the future by description and location. At this stage using a dedicated database like ElasticSearch to build an index doesn't make any sense, so I'll be using the `searchlight` Ruby gem.

See the other files in this directory for sample code.

## Links

* `searchlight` [on GitHub](https://github.com/nathanl/searchlight)