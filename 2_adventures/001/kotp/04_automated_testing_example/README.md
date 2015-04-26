# Sample CLI

This is a simple FizzBuzz game that is set up for automated testing using Guard and Minitest.

Considering showing examples for customized reporting, including
`minitest/pride`.  We will see what the next days bring.

The executable requires you to include the lib folder... so executing this with
the lib path set in your path, or using the command `ruby -Ilib bin/fizz_buzz 1
100` will both work.  I make no assumptions in the bin file other than to
realize that if I were to package this as a gem the load path would be taken
care of, otherwise the libraries you want to use with that executable are open to
your wishes rather than mine.

As long as the library for fizzbuzz conforms with
the API, it won't matter what library it loads, mine or another.

To run the tests, or continue to develop this, you will need to install
bundler, and then `bundle install`.  To run the tests, you can do `bundle exec
guard start`.  Or you can run the tests using `ruby spec/fizz_buzz_spec.rb`.
