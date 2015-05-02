# Day 20

I'll try to do a little more today, although I can't really guarantee too much, seeing as I still can't run any graphics.

I suppose I can try to expose something over the web. How bad could that be? How about a Sinatra app that responds to `/step/` and `/go`? I suppose I can use `/go` to start a new walk and `/step` to take a step. I wonder how that would affect the design of the domain.

For now, the web app responds with plain text, because screw it, that's why.

## Reviewing The Plan

This was the overall plan, in the middle of which we find ourselves.

1. Fixed viewport at the origin, simple grid of black and white squares, no representation of the ant. **WE ARE HERE**
1. Represent where the ant is.
1. Represent which way the ant is facing.
1. Movable viewport keeping the ant exactly in the middle of the screen.
1. Movable viewport keeping the ant approximately in the middle of the screen, in order to reduce viewport movement.
1. Profit?

## The Result

