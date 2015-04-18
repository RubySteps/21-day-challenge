# Day 6

Today I think I prefer to improve the design. Notably, I don't like that my "driver" invokes `puts` directly from two different places. I interpret what it does as signaling interesting events during the walk, so I prefer to model it that way in the code. Observer/observable seems to fit best here.
