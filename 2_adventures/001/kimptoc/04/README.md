Day 4 

* went off plan and built a little email file facility into the app at work - am sure it'll be needed
* did some app testing - things seemed to work :)
* email seemed to gobble up a few hours too :(

* right now, how to squash intermediate local commits when checking in... -
  * run this command to determine the range of commits to squash - returns a git hash
     * git merge-base [your branch] master
  * then run this command to squash the commits, for HASH use hash returned above
    * git rebase --interactive ${HASH}
  * you first get an edit window to choose which commits to involve
  * once thats saved, you get another edit window for the one commit message
* tomorrow - look at others commits and learn from them.
