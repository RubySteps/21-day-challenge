warm up
-------------

Here I am starting my adventurers on the RubySteps 21-Days Challenge.
 
### Steps...
 
1. Fork the RubySteps Challenge
   [repo](https://github.com/RubySteps/21-day-challenge) to my local machine.

2. I used [gitsh](https://github.com/thoughtbot/gitsh) for Git matters.
    It's an interactive shell for Git, that gives the ability to use git
commands.  
    `clone git@github.com:AhmedNadar/21-day-challenge.git`

3. Create a new branch **warmup** and make my sub-folders **ahmednadar/01_warmup**.

	```
  	cd 21-day-challenge
	checkout -b warmup
	mkcd 1_warmup/ahmednadar/01_warmup
	```
    
	- The last line I use `mkcd` command, which is a combination of `mkdir` and `cd`
	  together.
	- Inside my `~/.zshrc` it could be `~/.bashrc` file, I have the following script,
	which allows me to create a folder and subfolder as well and  `cd` to the last
	one. 
	- You need to create a new tab to relaunch your terminal after adding following script.

	```
	# mkdir a folder, cd into it
	mkcd () {
	  mkdir -p "$*"
	  cd "$*"
	}
	```
 
4. Create README.md file
  
    `vim 01_warm_up/README.md`

5. Push to fork repo using [gitsh](https://github.com/thoughtbot/gitsh) again.

	```
	  commit -m "First Step towards the 21-Days Challenge"
	  push -u origin warmup
	```
6. Go to my local [repo](https://github.com/AhmedNadar/21-day-challenge) click on **Pull request**, and create a new one. 

Mission Complete! :)

