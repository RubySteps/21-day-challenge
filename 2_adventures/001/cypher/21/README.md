# Day 21: Finally, some code!

And it's not even Ruby! :D

I decided to finish the 21 Day Ruby Challenge by actually writing some code.

Instead, I created a very simple web written in [Rust][] and using the [nickel.rs][] web
framework. It doesn't do much, but the point isn't to have a very useful web app, but to
learn and understand how Rust (and nickel.rs) works.

## Setup

First, you'll need to install Rust and Cargo (Rust's package manager, think Rubygems). To do
so, head over to the [Install Rust][install-rust] page, and grab the appropriate package (you should
get at least Rust 1.0-beta3).

Note to OS X users: You can also install Rust via Homebrew, but that doesn't include Cargo for some
reason, so you'll also need to install it manually. Right now, it's easier to just use the [provided
installer from Rust's homepage][install-rust].

Then, open up a terminal window (or recycle an existing one, it's really up to you), change into this
directory, and execute `cargo run`. First time you do this, you'll probably get a lot of output (like
Bundler!), and then it'll run a webserver on [localhost:6767][].

## A bit more than hello world

The program actually has a small trick up its sleeve. If you run `cargo run -- complex`, it'll boot up
a bit more complex example that demonstrates how to fetch things from a query string, and how to render
a template that displays data.


[install-rust]: http://www.rust-lang.org/install.html
[nickel]: http://nickel.rs
[rust]: http://www.rust-lang.org
