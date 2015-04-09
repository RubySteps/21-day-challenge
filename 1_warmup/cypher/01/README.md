# How I got here

* I went to https://github.com/RubySteps/21-day-challenge/blob/master/1_warmup/README.md, and read through the instructions
* I read through the instructions again, because I apparently missed the part where I write code
* I discover that no code seems to be involved; only creating directories, files and pull requests
* I open up Terminal.app
* I clone the repository into my projects folder
* I read through the instructions again.
* I look at the linked sample pull requests
* Alright. I go back to Terminal.app, make sure I'm in the cloned repository, and type `mkcd 1_war<tab>/cypher/01` (`mkcd` is a custom shell command that `mkdir -p`s its argument, and then `cd`s into it)
* I run `vim README.md`
* I am now typing this out
* Once I am done typing, I will close `vim` (or maybe background it), and type `git add README.md`
* Alright, I have now done all of the above. I also remember that I forgot to fork the repo, which I need to do before doing a pull request.
* Forked the repo on GitHub.
* Back in Terminal.app, I run `git remote set-url --push origin git@github.com:cypher/21-day-challenge.git`. This is a neat trick that allows me to pull stuff from the original repo, but when I push, it goes to my own fork.
* I now stage the README.md again, so it contains all the changes I've made since
* I type `git commit -m "My first warmup"`
* And then `git push`
* I go back to GitHub, and create my pull request.
* Before pressing "Create pull request", I check the instructions again. Oh, it needs to be a topic branch.
* Back to the terminal: `git checkout -b first-warmup`
* Read through the instructions again.
* Add a new git remote called `upstream`, using the original repo's url
* Change the `origin` remote url to my fork
* `git push` my new branch to my fork
* I am now ready to create my pull request. I go back to GitHub and do so.
