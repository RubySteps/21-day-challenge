# The big test clean up

I've moved all the tests into individual files, and created a Rakefile to run
them.

To run an individual test you need

```
ruby -Ilib test/path_to_test_file_test.rb
```
