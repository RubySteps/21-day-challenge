# Day 17

And now for something completely different: I'm traveling soon and don't plan to take my laptop with me. This means that I have to figure out how to write Ruby code without my laptop.

Fortunately, I have a new Bluetooth keyboard. I use this to control my phone. I use the phone and an SSH client to connect to my Rackspace account, where I can run Ruby code.

Unfortunately, I can't do graphics on my Rackspace account, so I guess I can do some refactoring for now, then hope that that doesn't hurt the GTK UI. Especially running without tests, this will be difficult. I don't know how much I'm going to get done.

Yesterday I ran some additional tests to check on the performance of my UI. With a grid radius of 100 (a 201-by-201 grid), it took about 28 minutes for the ant to take 12,000 steps. This doesn't exactly make incremental programming easy.

I have no plan for today, except to get my code running in a new environment. We'll see what happens after that.

## Reviewing The Plan

This was the overall plan, in the middle of which we find ourselves.

1. Fixed viewport at the origin, simple grid of black and white squares, no representation of the ant. **WE ARE HERE**
1. Represent where the ant is.
1. Represent which way the ant is facing.
1. Movable viewport keeping the ant exactly in the middle of the screen.
1. Movable viewport keeping the ant approximately in the middle of the screen, in order to reduce viewport movement.
1. Profit?

## The Result
