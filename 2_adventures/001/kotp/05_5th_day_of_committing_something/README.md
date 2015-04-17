# Sample CLI

This is a simple FizzBuzz game that is set up for automated testing using Guard and Minitest.

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

To change the reporter for the tests, simply modify the config.rb.sample and
use the reporter you want. notes in that file.

You could also chose to set the environment variable 'REPORT' to one of those choices.

For example:

`REPORT='Spec' bundle exec guard start`

Will give me a report such as:

    FizzBuzz::1 to 100
      test_0001_must follow the rules                                 PASS (0.00s)
    
    FizzBuzz::Single Numbers
      test_0001_must return 1 for 1                                   PASS (0.00s)
      test_0002_must return 2 for 2                                   PASS (0.00s)
      test_0003_must return "Fizz" for 3                              PASS (0.00s)
      test_0004_must return "Buzz" for 5                              PASS (0.00s)
      test_0005_must return "FizzBuzz" for 15                         PASS (0.00s)
      test_0006_must return "FizzBuzz" for 45                         PASS (0.00s)
    
    FizzBuzz::Edge Cases
      test_0001_must return FizzBuzz for 0                            PASS (0.00s)
      test_0002_must return -1 for -1                                 PASS (0.00s)
    
    Finished in 0.00882s
    9 tests, 9 assertions, 0 failures, 0 errors, 0 skips

And I won't need to touch the configuration file, but I would have to do so each time I started the command.



