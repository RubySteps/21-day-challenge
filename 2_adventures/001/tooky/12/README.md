Storing test suites in global variable. More convenient, but awkward to test :/

I'm not totally happy with injecting the suite_stack, then defaulting to
a global variable, but its not too complicated. I think this is going to allow
me to pull out the tests into separate files.
