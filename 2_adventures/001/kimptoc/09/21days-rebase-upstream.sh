#!/bin/bash -x

cd /home/kimptoc/dev/21-day-challenge/
git checkout master
git status
git fetch upstream
git rebase upstream/master
git status
git push -f origin master
git status
