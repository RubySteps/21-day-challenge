# Day 7

Today I intend to take a few more steps and reach the point where the ant finds itself on a black square, since I've done nothing to handle this case yet. In the process, I rediscover that the ant can't always turn left, so I need to implement that before I think about black squares.

I see that `turn_left()` currently remembers which direction the ant is currently walking in. It duplicates this knowledge with `LangtonsAntWalk` for, as far as I can tell, no good reason. I decide to turn it into a function.
