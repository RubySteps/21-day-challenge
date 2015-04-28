# Day 14

Yesterday I had some problems going from a 3-by-3 grid to something bigger. I saw some strange behavior from GTK+, and I don't know how much of it comes from my mistakes and how much of it comes from the quality of the library or its Mac OS implementation. I never feel good about blaming other people's stuff until I feel quite confident that I've done everything correctly that I should have.

Also yesterday I got a little overexcited by thinking that I could see the finish line, and as a result, I started taking overly-big steps. I need to pay attention today to avoiding doing that. Today, I take microsteps instead.

I have no idea where I'll end up today, so rather than declare a plan, I intend simply to do things until I get tired, then stop. Some days simply go like that.

## Reviewing The Plan

This was the overall plan, in the middle of which we find ourselves.

1. Fixed viewport at the origin, simple grid of black and white squares, no representation of the ant. **WE ARE HERE**
1. Represent where the ant is.
1. Represent which way the ant is facing.
1. Movable viewport keeping the ant exactly in the middle of the screen.
1. Movable viewport keeping the ant approximately in the middle of the screen, in order to reduce viewport movement.
1. Profit?

# The Result

In the process of running some more tests, I discovered that things started to go sour when I started trying to draw off-screen, meaning a square that isn't in the viewport. Perhaps GTK doesn't handle this very well on its own, and so I might need to protect against it.

It might help to say where the ant is in case it goes off the screen. I have in mind some text at the bottom of the main window describing the current step of the walk. I can do that tomorrow.
