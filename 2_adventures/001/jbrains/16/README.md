# Day 16

Yesterday, I ran into a problem. I wonder whether one of these two things is happening:

* I'm trying to draw too many square widgets, and I'm either running out of memory, or it's just slow.
* I'm trying to draw the square widgets too small, and GTK can't figure out how to render them, and is getting stuck.

Today I intend to figure that out&mdash;or at least try to, in the 30 minutes I have.

## Reviewing The Plan

This was the overall plan, in the middle of which we find ourselves.

1. Fixed viewport at the origin, simple grid of black and white squares, no representation of the ant. **WE ARE HERE**
1. Represent where the ant is.
1. Represent which way the ant is facing.
1. Movable viewport keeping the ant exactly in the middle of the screen.
1. Movable viewport keeping the ant approximately in the middle of the screen, in order to reduce viewport movement.
1. Profit?

## The Result

GTK is slow. If I use a grid radius of 50 (101-by-101 grid), then 1000 steps takes about 40 seconds to run. I figured out a rough model for the execution time at `1.1^radius/3`, which sadly means that with a grid radius of 100 (201-by-201 grid), 1000 steps would take about 1.3 hours. I can try that later to see whether it runs at all. Shame, too, since it takes about 32000 steps to see interesting stuff, but the action happens hundreds of units away from the origin. For a grid radius of 500, we're talking 5.3 quadrillion years, give or take. We don't have that kind of time.
