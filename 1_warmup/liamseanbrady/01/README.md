### Things I learned from this exercise

- `git commit -v` gives you a diff when you make the commit. That's cool.

- You can run one line of a ruby script directly in the terminal by doing

    ```
    ruby -e '5.times { puts "hello" }'
    ```
    The fact that the code has to be contained in within `''` seems to suggest that perhaps Ruby's eval method is being used here.

    I found out that this is possible from reading [kotp's first warmup exercise file](https://github.com/RubySteps/21-day-challenge/tree/master/1_warmup/kotp/01).

- I didn't really understand the concept of an **upstream** remote before doing this exercise. From what I understand, it seems like this is an easy way for us to fork a repository and at the same time avoid diverging from the up-to-date repository we forked from because we can **rebase** from it frequently.

    I got this information from [kotp's second warmup exercise](https://github.com/RubySteps/21-day-challenge/tree/master/1_warmup/kotp/02).

### Excited

- I'm looking forward to going through this 21-day challenge and seeing what I can achieve.

