# Day 6

Today I tried the roman_numerals` Exercism task again. I haven't finished it yet and didn't submit my solution. Converting “simple” numbers, i.e. no special cases like 9 works. Here's the excerpt from my solution:

```ruby
class Fixnum
  CONVERSIONS = {
    1000 => 'M',
     500 => 'D',
     100 => 'C',
      50 => 'L',
      10 => 'X',
       9 => 'IX',
       5 => 'V',
       4 => 'IV',
       1 => 'I'
  }
  
  def to_roman
    CONVERSIONS.fetch(self) { self.to_roman_by_digit }
  end
  
  def to_roman_by_digit
    # snipped the half-working rest
    self
  end
end
```

I finally managed to publish the source code for my personal portfolio in a GitHub repo. My web site is still outdated but I figured creating a public repo hopefully creates some pressure to update it. I created it in 2012 and in October 2014 I added the [Middleman](https://middlemanapp.com) gem which is a static site generator. I wanted to experiment with it and I like to play with new technology and tools in side projects.

## Links

* [GitHub repo](https://github.com/lenn4rd/handwerkneu.de) for my portfolio