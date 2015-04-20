# Day 8

Today I want the ant to do the right thing on black squares. This means... Oops.

This means now noticing that I read the rules incorrectly, and that the ant should have turned right, not left, all this time. Not a disaster, but an annoyance.

Good news: I have to implement "turn right" anyhow, so I can do that first, so that the ant can turn right instead of left on a white square, then I can implement "flip a black square to white", then I'll have a working engine.

Then I can think about how to do graphics, which I've never done in Ruby before, and which I haven't done since high school using the Graphics Development Kit for WATCOM BASIC. That will be interesting.

## Turn Right, You!

I can just do the opposite of turning left. I'll subtract one instead of adding one... but I'd better verify that -1 % 4 == 3. It is. I don't have to use `@@directions_turning_left.reverse`, although I might use that eventually. One small change and the ant now turns right on a white square. (Well, on all squares.)

