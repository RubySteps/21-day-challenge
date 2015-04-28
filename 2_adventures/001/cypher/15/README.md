# Rust

I'm trying to learn Rust. Mostly because Go seems to be just "C done right", but I don't think we need
a better C (although Go's CSP implementation is rather nifty).

For today, I decided to start by reading through the source code for [Nickel.rs](https://github.com/nickel-org/nickel.rs),
a web framework for Rust.

The hardest part about Rust (apart from getting a program to compile in the first place ;)) is getting used to
the memory semantics. Unlike pretty much all other programming languages, if the compiler can't keep track
of who owns what memory, it will yell at you -- but it is for my own good. I think.
