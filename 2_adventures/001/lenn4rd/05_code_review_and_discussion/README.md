# Day 5

This day I began `roman_numerals` Exercism task which I found quite hard to implement. The goal is to convert a number into a roman numeral, e.g. 6 into VI. The number of special cases make this problem hard to crack because from 6 to 8 the Romans append I to the number V and they saw 9 as 10 - 1, i.e. IX.

My ideas where to have a number of conditionals like `if … elsif … elsif … end`, something similar to the greatest common denominator to get the largest component of a number, e.g. 51 equals LI, and recursion to build the resulting string.

On day 4 [@kotp](https://github.com/kotp) asked for feedback for his solution to the FizzBuzz exercise. We discussed a bit in pull requests [#283](https://github.com/RubySteps/21-day-challenge/pull/283) and [#333](https://github.com/RubySteps/21-day-challenge/pull/333) and I hope he finds some value in what I wrote. I'm ending this today with just this README.