# Monads in Rust

So, monads are fascinating, and once you get what they're about, they're about as complicated to understand
as, say, a stack. But implementing a general-purpose monad type/trait in Rust is, as it turns out, impossible, because
Rust lacks so-called higher types. Higher types are to types what types are to values. Bascially, higher types
are the types of types.

The following code is [from Rust's test library](https://github.com/rust-lang/rust/blob/master/src/test/run-pass/monad.rs):

```rust
trait vec_monad<A> {
    fn bind<B, F>(&self, f: F ) -> Vec<B> where F: FnMut(&A) -> Vec<B> ;
}
```

So this implements a trait in Rust (think of traits like interfaces in Java or C#), which promises to
implement the `bind` method on any type that uses this trait. The `bind` method takes a closure (aka lambda) and will
return a `Vec` of the same type. This is, as the name of the trait implies, a monad (specifically, the `Many` monad
from Tom Stuart's presentation). But you'll also notice that the `Vec` type is hardcoded in this trait.

This is the aforementioned limitation of Rusts type system. The good news is that it is "only" a limitation of the
compiler implementation, not the language itself. So we may have higher types in Rust at some point in the future.



So, back to creating a simple web app in Rust using Nickel :)
