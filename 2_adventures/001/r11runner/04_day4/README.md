# Adventure 04: script to look up a word in the Cambridge British English Dictionary

The idea came, as I was looking at [Dino-Herbert](https://github.com/Dino-Herbert)'s [script from day03](https://github.com/rubysteps/21-day-challenge/blob/master/2_adventures/001/Dino-Herbert/03/testscrape.rb)

Perhaps it would make more sense to use the Cambridge Dictionaries API. But this way, I got to know nokogiri at least. :)

What is missing:
 - handling the error case, when no such word is found
 - separating the examples belonging to different definitions

Further possible improvements:
 - let the user choose a dictionary (but still providing a default)