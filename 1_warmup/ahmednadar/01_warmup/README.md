warm up
-------------

Here I am starting my adventurers on the RubySteps 21-Days Challenge.
 
### Steps...
 
1. Fork the RubySteps Challenge
   [repo](https://github.com/RubySteps/21-day-challenge) to my local machine.

  * I used [gitsh](https://github.com/thoughtbot/gitsh) for Git matters.
    It's an interactive shell for Git, that gives the ability to use git
commands.  
    `clone git@github.com:Phonbopit/21-day-challenge.git`

2. Create a new branch and make my sub-folder 'ahmednadar'

```
  cd 21-day-challenge
  git checkout -b warmup
    mkcd 1_warmup/ahmednadar/01_warm_up
```
    
- The last line I use `mkcd` command, which is a combination of `mkdir` and `cd`
  together.
Inside my `~/.zshrc` it could be `~/.bashrc` file, I have the following script,
which allows me to create a folder and subfolder as well and  `cd` to the last
one. You need to create a new tab to relaunch your terminal after adding following script.

```
  # mkdir a folder, cd into it
  mkcd () {
    mkdir -p "$*"
    cd "$*"
  }
```
 
3. Create README.md file
  
    `vim 01_warm_up/README.md`

4. Push to fork repo using [gitsh](https://github.com/thoughtbot/gitsh) again.

```
    commit -m "First Step towards the 21-Days Challenge"
    push -u origin warmup
```

Mission Compelete! :)

