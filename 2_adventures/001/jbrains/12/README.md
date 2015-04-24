# Day 12

Today I'd like to see path to connecting the view and model to one another, so that I can refocus on adding features to the graphical interface. I have some code that does this, but I need to step back, draw the design, and get a rough idea where the pieces belong, then move them there. This means turning `try_connecting_grid_square_to_model.rb` into a design I will always be able to understand.

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
