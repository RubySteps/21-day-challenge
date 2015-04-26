#readme day 6

Didn't have a chance to work on ruby stuff today, was too busy trying to make this golang thing work

Not sure how  you all feels about other languges in the repo but theres only one way to find out. 

I misread the instructions for one of the exercism problems, i thought it was asking to find all the prime factors of a number and then return "pling" if 3 was one of them, "plang" for 5, and "plong" for 7.

All I really had to do was something like
```go
  if input%3 == 0{
    output = "pling"
  } 
// and so one
```
Instead I came up with this highly convoluted solution that calculates all divisors, removes the ones that arent prime, and then returns based on that array.

