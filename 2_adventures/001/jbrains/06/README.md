# Day 6

Today I think I prefer to improve the design. Notably, I don't like that my "driver" invokes `puts` directly from two different places. I interpret what it does as signaling interesting events during the walk, so I prefer to model it that way in the code. Observer/observable seems to fit best here.

## Result

I moved all the `puts` calls into one place. This led me to observe that the message "At the beginning of his walk...", which looks special, isn't really. It's just one implementation of "taken step number 0".
