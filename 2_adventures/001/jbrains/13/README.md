# Day 13

Today I'd like to see path to connecting the view and model to one another, so that I can refocus on adding features to the graphical interface. (This sounds familiar, seeing as I wrote it yesterday.)

I need the Grid to expose itself as Grid Squares. If I can do that, then I can connect the view to the model and It'll Just Work<sup>SM</sup>. I intend to focus on that now.

Unfortunately, I see a fundamental mismatch between what the GUI wants and what `LangtonsAntWalk` does. The GUI wants to update the domain through the Gateway object, but `LangtonsAntWalk` hides those details, instead only offering a single event to the outside world: `step_taken(how_many, ant)`. How do I combine these two things while keeping the domain in the dark about the GUI?

Taking a few more seconds to think about it, it seems that `LangtonsAntWalk` publishes enough information through its `step_taken` event to give the GUI everything it needs, albeit in a quite annoying fashion: rather than the GUI being able to listen to the flipping of the color of a single square, it gets a new `ant` after each step, meaning that it would have to repaint the entire grid after each step. This feels wrong. And so I find myself stuck between two wrong choices: either `LangtonsAntWalk` has to change its design to accommodate the GUI, or the GUI has to do far more work than seems necessary.

Hm.

Looking at the code more closely, I notice that the design of the "text-based UI" suffers the same problem. At the end of each step, it "paints" the grid by listing all the black squares. This works just fine for text, but represents an accident of implementation, and perhaps a better way to do this involves noting which squares have flipped, rather than "repainting" the entire grid. If I do this with the text-based UI (which already works), then there would be no special design for the GUI to use. This gives me a place to start.

## Reviewing The Plan

This was the overall plan, in the middle of which we find ourselves.

1. Fixed viewport at the origin, simple grid of black and white squares, no representation of the ant. **WE ARE HERE**
1. Represent where the ant is.
1. Represent which way the ant is facing.
1. Movable viewport keeping the ant exactly in the middle of the screen.
1. Movable viewport keeping the ant approximately in the middle of the screen, in order to reduce viewport movement.
1. Profit?

### To Draw a Grid

Even those we're not doing TDD with automated tests, I will want to be able to build the grid incrementally. I figure I should try this:

1. Draw a 3-by-3 grid, with the origin in the center, and all squares white.
1. Color an arbitrary square black.
1. Color an arbitrary black square white again. **WE ARE HERE**
1. Draw a bigger (2n+1)-by-(2n+1) grid with the origin in the center.

I have one design constraint: I want the grid panel (or whatever Gtk calls it) implemented in its own module (not necessarily `module`) with as little dependency on its context as possible. In other words, I want to be able to embed the grid panel wherever I want.

# The Result

Another Chunnel problem. The Grid Square Gateway wants to talk to a Grid Square (which responds to `color()` and `flip_color()`; however, the Grid in the domain doesn't provide a Grid Square view to itself. Right now, I have no way to connect the Grid Square Widget to the corresponding Grid Square in the domain. I need the Grid to expose itself as Grid Squares. But I'm tired, so I'll do that tomorrow.

