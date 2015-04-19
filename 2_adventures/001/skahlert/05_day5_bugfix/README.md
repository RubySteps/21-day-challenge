#Day 5

Fix for yesterdays bug:

##Off by one hour!

Yesterday's script was close, but not quite correct. It always gave me back one our too much, when calculating the deadline.

It's always a good guess starting with time-zones... one of the biggest problems computer science has ever seen :smile:

Took me a while to figure out and I had the chance to see the difference when working with Time and DateTime classes.

In the end it was the conversion from seconds to Time, where the local time zone messed it up.
