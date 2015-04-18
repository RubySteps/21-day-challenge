# Hangman

A slight digression from the webstats app.

I believe there is a lot to learn for me even in this simple example. The first and foremost,
how to read the word from the dict file efficiently. Right now, it's linear time. The larger the random
number that is generated, the more I'll have to scan the file to reach that word. I guess it's time
to explore some indexing algos and formats.

Also, it'd be instructive to organize this simple app in a nice and balanced format without a lot of
code smell (which is there currently)
