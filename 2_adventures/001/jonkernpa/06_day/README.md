# Adventure Day 5

Victor's innocent comment about

    def initialize(opts={})
      @host            = opts[:host]
      ...
    end

Victor queried:

    For more current versions of Ruby this is
    no longer necessary. But I think the question
    then becomes "What exactly can I pass in that are named?"

That sent me on some research...

Just what are the options for improving on the "classic"
arguments-as-hash method parameters?

So, the hint was "more current versions of Ruby" so I set off
looking for what Ruby 2.0+ offers now.

* (Method arguments you can sink your teeth into)[http://www.sitepoint.com/method-signature-you-can-sink-your-teeth-into/]
* (Keyword Arguments in Ruby 2.0)[http://chriszetter.com/blog/2012/11/02/keyword-arguments-in-ruby-2-dot-0/]

The second reference mentions:

    One of the new features of Ruby 2.0 are keyword arguments.

and

    Ruby 2.1 introduces required keyword arguments.
    You can use required argument by skipping the default value.

Considering rewriting the method with explicit args seems too verbose...

Then I discovered ()[http://rubymonk.com/learning/books/5-metaprogramming-ruby-ascent/chapters/47-real-world/lessons/109-named-initializers]
which described a technique to essentially deal with non-existent local vars.

    def initialize(h)
      h.each { |key, value| send("#{key}=", value) }
    end

But that can't possibly be what Victor was hinting at, right?