# TestCases....

I think the proc as test case idea has lived long enough. There's a couple of
reasons I've pulled it out.

1. I want to add more data to the test cases - names, where they are defined
   etc., so I need a different data structure.
2. I don't like that I can't pass a list of Suites to run_all. This is becuase
   running a single case is still a static method. I want to move this to the
   test case, and then I believe I can have a run method on a suite as well.
