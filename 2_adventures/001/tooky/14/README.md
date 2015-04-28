The assert methods are now inside a namespace. I've introduced the idea of
a Fixture that we run a test in-the-context of. I _think_ this should make it
easier to add setup / tear_down methods, but I'm going to have to spike it a bit
to play with it. It might be a bit complicated.
