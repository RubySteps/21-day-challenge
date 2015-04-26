# Day 7

Today I intend to take a few more steps and reach the point where the ant finds itself on a black square, since I've done nothing to handle this case yet. In the process, I rediscover that the ant can't always turn left, so I need to implement that before I think about black squares.

I see that `turn_left()` currently remembers which direction the ant is currently walking in. It duplicates this knowledge with `LangtonsAntWalk` for, as far as I can tell, no good reason. I decide to turn it into a function.

After I finish this, I notice that when describing the walk, I don't explicitly state the color of the square on which the ant find itself, since I had always assumed that it was black. Fortunately, nobody but the console-based walk reporter cares, so I find it easy to change. It does, however, require asking the `Grid` for the color of a square at a given location. After building this, it becomes clear that the ant takes the wrong step from a black square.

Now that I have this working, I no longer feel in the mood to duplicate all the code in order to turn right. I'll leave that for tomorrow.

I look for things to clean up. I no longer need `Direction.west` and remove it. I would prefer not to need `Direction.north`, but I think I prefer it to `new Direction(1, 0)`, at least for now, so I keep it.

I also notice that, at least for now, if the ant continues walking indefinitely, then the same four squares will be marked as black-colored over and over again. This doesn't affect the correctness of the code, but only wastes memory, so I don't mind for now. I don't want to forget about this potential problem, however, so I log it as an issue.

## The Result

I find the design very cohesive so far. We have scattered assumptions that the ant always stands on a white square. I'd like to deal with that next.

# Epilogue

Someone has told me that I can just use `Array#cycle()` which returns an `Enumerator`, so I can use `@@directions_turning_left.cycle()` to turn left and `@@directions_turning_left.reverse.cycle()` to turn right.

