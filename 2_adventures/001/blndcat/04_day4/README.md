# Day 4

Rebase I

Doing the following and understanding what is happening:
edited .git/config and removed [remote "upstream"] lines
then

git remote add upstream https://github.com/RubySteps/21-day-challenge.git

git fetch upstream

git checkout master

git rebase upstream/master
pushed to github

after that created day04 branch, dir, and this README

* Notes
Figured out the day ends/starts 3am local time. I think everyone should either calculate it or note the timestamp on the emails. 

Next time I should try using a git command to remove the lines in .git/config

Last time (day 2?) I created the new branch first, which lead to slightly different results.  I should probably take some time to work through and understand why this was.

I will probably stick with RSpec for TDD for the time being

During a presentation given by GitHub, I learnt that 
git commit -m"commit message"
is totally valid. Note the lack of space between the -m and the "
Go on try it, you know you want to save a keystroke every time you type a commit message ;)


