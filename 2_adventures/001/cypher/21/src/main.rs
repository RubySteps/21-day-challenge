// We would like to use the `nickel` crate, and load all of its macros so they're available
// for us. If we would only like to load certain macros, we could do e.g. `#[macro_use(router)]`
#[macro_use]
extern crate nickel;


// The `nickel` crate contains a struct called `Nickel`. This is the thing that holds our
// application.
// In order to not always have to type the complete `nickel::Nickel`, we make it available in
// our current scope.
use nickel::Nickel;


// Let's define a new function, called `hello_world`, which takes no arguments, and returns
// nothing.
fn hello_world() {
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


// For our next trick^Rexample, we're going to need a few more things, starting with a HashMap from
// the standard library
use std::collections::HashMap;

// use nickel::status::StatusCode::{self, NotFound, BadRequest};

// We also need access to a few more of Nickel's structs and traits
use nickel::{
    // These are the structs we need to define our handler
    Request, Response, MiddlewareResult,
    // These are traits. In order to use functions and methods implemented by a trait,
    // we need to import the trait itself
    QueryString, HttpRouter
};


fn complex_server() {
    // Like before, we need a server to handle requests
    let mut server = Nickel::new();

    // Defines a custom handler function. There's a few things going on here:
    // * This function is only visible inside `complex_server`
    // * The `'a` is not a template, but a lifetime specifier, which we'll need later
    // * The `request` argument is a mutable reference to a Request struct
    // * The `response` argument is a Response struct. By specifying the lifetime specifier, we
    //   tell rust that this will actually live longer than the scope of handler function (I think)
    // * And finally, we will return a MiddlewareResult struct, which will also survive the
    //   scope of the handler function
    fn handler<'a>(request: &mut Request, response: Response<'a>) -> MiddlewareResult<'a> {
        // Fetch the Query object, which holds the parsed query string
        let query = request.query();

        // Fetch the `name` from the query string, or default to 'unknown person'.
        // This actually works because `get` returns an `Option` type, which has two possible
        // values:
        // * Ok(wrapped_value): This lets you know that it was successful, and the actual result is
        //   the `wrapped_value`
        // * Err(error): This lets you know that something went wrong, and you can get more details
        //   by accessing `error`
        // `unwrap_or` is basically a helper function that says "If the result is `Ok`, return the
        // wrapped value, but if it is not, return the argument passed to me".
        // Or, in Ruby: name = query.get('name') || 'unknown person'
        let name = query.get("name").unwrap_or("unknown person");

        // Allocate a new HashMap, that maps strings to strings.
        // (to be exact, maps references to strings to references of strings)
        // In Ruby: data = {}
        let mut data = HashMap::<&str, &str>::new();

        // Let's insert our name we extracted previously
        // In Ruby: data['name'] = name
        data.insert("name", name);

        // And finally, let's render a template using the provided data
        // Nickel provides Mustache for all your templating needs.
        response.render("templates/index.tpl", &data)
    }

    // Install our handler to work on "/"
    server.get("/", handler);

    // server.utilize(router!{
    //     get "/" => |request, response| {
    //         let mut data = HashMap::<&str, &str>::new();
    //         let query = request.query();

    //         let name = query.get("name").unwrap_or("unknown person");
    //         data.insert("name", name);

    //         response.render("templates/index.tpl", &data)
    //     }
    // });

    // let mut router = Nickel::router();

    // // try calling http://localhost:6767/query?foo=bar
    // router.get("/query", middleware! { |request|
    //     if let Some(vals) = request.query().all("foo") {
    //         format!("Your foo values in the query string are: {:?}", vals)
    //     } else {
    //         format!("You didn't provide any foo values!")
    //     }
    // });

    // // try calling http://localhost:6767/strict?state=valid
    // // then try calling http://localhost:6767/strict?state=invalid
    // router.get("/strict", middleware! { |request|
    //     if request.query().get("state") != Some("valid") {
    //         (BadRequest, "Error Parsing JSON")
    //     } else {
    //         (StatusCode::Ok, "Congratulations on conforming!")
    //     }
    // });

    // router.get("/", middleware! { |request, response|
    //     // let query = request.query();
    //     // let name = query.get("name").unwrap_or("unknown person");
    //     let name = "unknown person";

    //     let mut data = HashMap::<&str, &str>::new();
    //     data.insert("name", name);

    //     response.render("templates/index.tpl", &data)
    // });

    // server.utilize(router);

    // As before, start the server on localhost and listen on port 6767
    server.listen("127.0.0.1:6767");
}


// We need this to access the arguments passed to the executable
use std::env;


// This is where we enter our program. Like C, `main` denotes the function that is called whenever
// our program starts.
fn main() {
    let args: Vec<String> = env::args().collect();

    // If we didn't get any arguments, or if the first argument is not "complex",
    // run the simple example
    if args.is_empty() || (args[1] != "complex") {
        println!("Running hello world example...");
        hello_world();
    } else {
        println!("Running complex example...");
        complex_server();
    }
}
