// We would like to use the `nickel` crate, and load all of its macros so they're available
// for us. If we would only like to load certain macros, we could do e.g. `#[macro_use(router)]`
#[macro_use]
extern crate nickel;


// The `nickel` crate contains a struct called `Nickel`. This is the thing that holds our
// application.
// In order to not always have to type the complete `nickel::Nickel`, we make it available in
// our current scope.
use nickel::Nickel;

// This is where we enter our program. Like C, `main` denotes the function that is called whenever
// our program starts.
fn main() {
    // Allocate a new Nickel server, and assign it to the `server` variable. We do this by calling
    // the `new` method defined for the `Nickel` struct, which allocates a Nickel object, sets it
    // up for us, and then returns it. This works like Ruby's `new`, except this is not a
    // language-level construct, but a convention.
    // The `mut` lets Rust know that this is a mutable variable. By default, variables in Rust
    // are immutable.
    let mut server = Nickel::new();

    // By itself, our new server doesn't do much (Nickel does set up some error handling for us,
    // but we're not interested in that right now). In order to get something useful out of our
    // server, we tell it to utilize a new router.
    // We do this by calling the `utilize` method on our server. If we look at the definition of
    // `utilize`, we see that it can take any type, as long as it implements the `Middleware`
    // trait.
    // We could define our own type that implements `Middleware`, but Nickel provides a handy macro
    // for us to use that streamlines the entire process for us. We call the macro via `router!`
    // and passing in some code so the macro knows how to set up our new router.
    server.utilize(router! {
        // This should be straightforward to understand -- any GET request is handled by the
        // following closure, which gets the request and response objects handed in as arguments.
        // We can simply return a string which is turned into a response for us by Nickel.
        // Note the lack of semicolon at the end of the string -- this tells Rust this line should
        // return its value. We can use this not only for short methods without typing return, but
        // also in other places, like if statements.
        get "**" => |_req, _res| {
            "Hello world!"
        }
    });

    // Now that our server is set up, let's actually listen for some requests on the provided host and
    // port. If you run this program, Nickel will helpfully print out this information for you, so
    // you know when you can open your browser and look at the glorious hello world we just
    // created.
    // This will actually block the execution of the rest of the program. Since this is only for
    // demonstration purposes, we're fine with this.
    server.listen("127.0.0.1:6767");
}
