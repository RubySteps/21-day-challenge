# Day 15

Wow am I going to phone this one in.

I want to add some text feedback to the GTK UI so that I can track where the ant goes if it goes off the screen. This might help me figure out why my app seems to crash some of the time.

The plan:

1. Wrap the current main window in a container. Probably a vertical layout box.
1. Add some hardcoded text at the bottom of the screen.
1. Add a start/stop button.
1. Hook the text up to events in the ant's walk.

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
