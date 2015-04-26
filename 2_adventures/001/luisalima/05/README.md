So I wanted to do some algorithmic explorations and compare some
algorithms in imperative languages with functional languages. I needed
a listing of algorithms so I took
[the algorithms: design and analysis coursera class](https://class.coursera.org/algo-007/lecture),
which also has nice slides on top :)

## Explorations in multiplication

I started by firing up good ol' ghci and writing this:

```haskell
foldr (\(acc, carry) x -> let (res, newCarry) = splitMul (x+carry)*4 in (res : acc, newCarry)) ([], 0) [5, 6, 7, 8]
```

However, all I got was a nice error on my face. Can you spot the bug?
Turns out I couldn't that easily. So my next step was to take that
good ol' lambda and decompose it until I found that the "*4" was the
offending one! Here's the correct expression:

```haskell
-- works
(\(acc, carry) x -> let (res, newCarry) = splitMul (8+0) in (res: [], newCarry)) ([], 0) 5
-- still works
(\(acc, carry) x -> let (res, newCarry) = splitMul (x+0) in (res:acc, newCarry)) ([], 0) 8
-- still works... <yawn, getting bored>
(\(acc, carry) x -> let (res, newCarry) = splitMul (x+carry) in (res: acc, newCarry)) ([], 0) 8
-- haha! This was a hard one to catch: since the application of
-- "splitMul" takes precedence, I was trying to multiply a tuple by an
integer... duuuuuh..., of course it didn't work...!
(\(acc, carry) x -> let (res, newCarry) = splitMul (x+carry)*4 in (res: acc, newCarry)) ([], 0) 8
```

Turns out I was actually using carry in the wrong way and using a
foldl instead of a foldr. It only goes to tell me that I think ahead
wayyy too fast. Here's the correct expression:

```haskell
let (lst, last) = foldr (\x (acc, carry) -> let (res, newCarry) = splitMul (x*4+carry) in (res: acc, newCarry)) ([], 0) [5,6,7, 8] in (last:lst)
```

I'm not sure you got the point, but I'm trying to multiply `5678` by
`1234` -- this is the first step, to multiply `[5, 6, 7, 8]` by `[1, 2,
3, 4]`.

But now I gotta go and do some of my real work, so see you tomorrow
again ;)
