I'm editing stuff on github! Now I can edit while in Madrid with my iPad.

Here are some notes on Haskell.

> Quote from [learn haskell the hard way](http://yannesposito.com/Scratch/en/blog/Haskell-the-Hard-Way/)
> -- By default:
> f g h x         ⇔  (((f g) h) x)

> -- the $ replace parenthesis from the $
> -- to the end of the expression
> f g $ h x       ⇔  f g (h x) ⇔ (f g) (h x)
> f $ g h x       ⇔  f (g h x) ⇔ f ((g h) x)
> f $ g $ h x     ⇔  f (g (h x))

> -- (.) the composition function
> (f . g) x       ⇔  f (g x)
> (f . g . h) x   ⇔  f (g (h x))
