Day 18

Not much to report again today. Doing my real job.

I spent a little time looking up guides to terminal commands for Windows powershell. Then decided best not to continue with that as most guides seemed to be focussed on systems administration processes. At this time I just need to get on top of the basics.

I had previously (the other week before my monster outage) accidentally found myself inside a command line text editor. Not sure if I need to learn about those or not. I'm using Windows Notepad++ now for editing text files, and presumably I'd use same for creating code.

So I figure it's time to actually write some code. So many big ideas on what I'd like some software to do and so little knowledge - not sure where to start!

I added my first line of ruby code in a file called addup.rb

Nothing exciting, just creates a variable "a" and sets it to equal 1 + 1 and printed it out.

	a = 1+1
	puts a

then I checked to see if I could run it from the command line in Powershell

I navigated to the correct directory, typed ruby addup.rb and it worked.
None of this "hello world!" stuff for me, straight to doing some maths. lol

I added some more. 1+2 and checked it worked. It does.

So then I started to see if I could find and use the constant Pi, as in the ratio of a circle's circumference to its diameter.

After a bit of searching I discovered I needed to use the following in ruby to create a constant called Pi:

	Pi = Math::PI
	puts Pi

It displays Pi to 16 significant digits.

Then I worked out how to perform a couple of trig functions, applying sine and cosine functions.

	b = Maths.sin(Pi)
	puts b
	b = Maths.cos(Pi)
	puts b
	
I noted that cosine of PI give correct answer of -1, but the sine of PI has a rounding error giving a very small number instead of zero.

I get the same slightly wrong answer if instead of using the defined variable Pi in the formula, I use the Ruby code for the Pi constant, i.e. Math::PI

	b = Maths.sin(Maths::PI)
	puts b
	
That just tells me the variable Pi was assigned with integrity to begin with.
	
The real irrational number Pi is actually slightly larger than the Ruby constant PI.