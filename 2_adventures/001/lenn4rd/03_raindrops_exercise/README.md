# Day 3

Today is the first day to work towards my goal of doing one of the Exercism tasks each day. The next in line is `raindrops`: essentially, it's a variation of [Fizz buzz](http://en.wikipedia.org/wiki/Fizz_buzz).

I iterated a few times on my solution until I was satisfied and couldn't come up with something better. I monkey-patched `Fixnum` and added a `prime_factor_of?` instance method for use something like this instead of a class method: `3.prime_factor_of?(13)`

I think the conditional for `return` in line 21 is still ugly, but I haven't found a better way yet. Something like `sound || number.to_s` would be ideal which doesn't work because an empty `sound` always evaluates to `true`, so `number.to_s` is never returned.

Run the tests with `ruby raindrops_test.rb` and feel free to nit-pick on my solution!

## Links

* The [description](https://github.com/lenn4rd/exercism/blob/master/ruby/raindrops/README.md) for this exercise
* [My solution](http://exercism.io/submissions/add604623a654db38cc79fd05ca9fb5b) to `raindrops` on Exercism
* All the Exercism tasks I completed in my [GitHub repo](https://github.com/lenn4rd/exercism)