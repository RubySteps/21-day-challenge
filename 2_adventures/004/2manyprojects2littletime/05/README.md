Today I'm going to modify the basic frequency analyser to:
 - have a test harness
 - accept arguments and run it in different modes
   - interactive: e.g. `ruby freql "string to analyse"`
   - file-mode: e.g. `ruby freql -f ./test.txt`