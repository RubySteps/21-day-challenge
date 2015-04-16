# Day 4

Today I wanted the ant to be able to take a second step. I don't mind using foreknowledge of the exact path to hardcode things. Once the ant takes 5-10 steps, I should have enough structure into which to shove the remaining behavior.

But wait! The ant doesn't flip the color of the square on his first step. I have to fix that.

Although I'm not practising TDD, I have been programming intentionally, meaning that I invoke functions before I've written them, so that I know what I need to write. I can still "fake it 'til you make it" by leaving comments behind that show what horrifying assumptions my new functions are making. For example:

```
class Grid
  # ...
  def flip_square_at(location)
    # assume the square is white
    black_squares << location
  end
end
```

I also notice in my output that although I show the Direction, I now show it as a Vector, when a human might prefer a more human interpretation of the Vector. I think that takes more than two minutes, so I create an issue.
