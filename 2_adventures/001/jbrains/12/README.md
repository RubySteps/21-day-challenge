# Day 12

Today I'd like to see path to connecting the view and model to one another, so that I can refocus on adding features to the graphical interface. I have some code that does this, but I need to step back, draw the design, and get a rough idea where the pieces belong, then move them there. This means turning `try_connecting_grid_square_to_model.rb` into a design I will always be able to understand.

I care about connecting a Grid Square view object with a Grid Square model object. The view paints a square the correct color, whereas the the model knows the correct color. The view listens to the model and repaints the correct color when the model changes. This means a few things:

* The view and model are tangled, although not terribly. At least the model doesn't really know that the view is a view, but rather only "something that cares about when my color changes".
* The "model" is really a user interface peer, and not an object "in the domain". The terms that people tend to use kinda suck here. I really have a Grid Square Model Gateway, which belongs to the view layer, but which gives me access to a Grid Square Domain Model Object. Yuck.

This past part bothers me, so I should probably try raising the level of abstraction. Let me try again.

* The "model" is really something that exposes the Grid Square Domain Object as an observable so that the view layer can react to changes. It adds observer/observable behavior to the Grid Square, so it really acts as a Grid Square Gateway, rather than the Grid Square itself.

I prefer this. I see the relationships and the division of labor more clearly.

1. The Grid Square GTK widget handles painting the color of the square.
1. The Grid Square Gateway mediates between the widget and the domain object. It keeps the widget up to date and helps the widget tell the domain object when it needs to change color.
1. The Grid Square (domain object) only cares about its color.

Easy. I think I can build this today.

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
