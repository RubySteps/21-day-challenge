# Second Warmup Exercise

## We really should add an upstream reference

Adding an upstream remote gives us the ease of keeping up with the changes.

    git remote add upstream git@github.com:RubySteps/21-day-challenge.git

## Rebasing from upstream

Now we can easily rebase our code from upstream.

I am in branch 01_warmup and execute the following command:

    git rebase upstream/master

Then I add this file, and do another pull request.

From my editor, it is as simple as these steps:

    :!git add % && git commit -v


