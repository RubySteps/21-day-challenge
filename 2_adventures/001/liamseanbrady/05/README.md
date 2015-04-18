### What I Learned Today

- TDD is hard once you begin to move away from either Rails infrastructure or testing basic Ruby methods.
- In the very first stages of building my basic Trello client, [Trello Rat](https://github.com/liamseanbrady/trello-rat), I wanted to get going really quickly by authorizing the user with a token from Trello by simply calling `IO.popen("open urlwithdevkeyandrequestfortoken")`, but I found this really difficult to test. I wanted to test that the `get_token` method was successfully making this `open` system call, but I was unsure of how to do this without actually making the 'real' call on my own system.
- This was really frustrating, and not particularly necessary (since I could probably integrate OAuth and things would be a little easier), but I think hitting these brick walls throughout the development of this little app will provide me with **lots of awesome learning opportunities**.
- I need to step back and have a clearer think about how I want this Trello client to work, otherwise I'm at risk of just taking shots in the dark and making it up as I go along - I think having a clearer idea of what I want to achieve will bring the fun back to TDD. **I think tomorrow's challenge will be writing some user stories**.
- Looking forward to working on this as a longer term project!
