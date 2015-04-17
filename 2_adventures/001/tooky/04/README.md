# Running more tests.

So I can now run multiple tests, and report on them.

I've used this test infrastructure to run my own tests now and I'm
reporting the number of passes and failures.

I refactored the Result object a little to stop twiddling with its privates, and
removed the use of Struct.

## Tomorrow

* Check that 1 test failing doesn't halt the whole run!
* Fix the problem that I can't see what's causing failures anymore... some kind
  of reporter perhaps?
* Maybe assert equal...
