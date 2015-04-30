# Day 16

I haven't given up on the `roman_numerals` exercism.io task. I haven't come a lot further since day 5 when I added my partly working solution. I'm using a recursive approach that builds the resulting string for a number by subtracting the largest roman numeral that fits into it, e.g. if we want to convert 51 that would be 50 or L. The remainder, 1, would be the starting point for the recursion. In this case we'd need two iterations and get `LI` as a result.

At the moment I'm working on that part of starting the next iteration. Somehow it's way more complicated as it sounds. Turns out there are side effects when I try to convert more than one number. Those side effects pollute the conversions table, a hash, that looks like this:

```ruby
{ 10 => "X", 9 => "IX", … }
```

After the first run it is:

```ruby
{ 10 => "XI", 9 => "IX", … }
```