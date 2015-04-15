##Superhero Power creator

Randomly creates a superhero superpower from a csv I created
I was inspired by faker to build a superhero random creator thing

**Updated** Now a gem that returns a random superpower

TO use

* gem install ./superhero-0.1.0.gem
* `require 'superhero'` at the top of your file
* somewhere in your code call `Superhero.power` to get a random superhero power


Notes

I have a file which creates a csv given a string of superpowers I copypasta'd from the internet. 
I wanted to experiment with rubys `'csv'` stuff and I thought writing and reading from a csv was a good Idea. I love the idea of creating a text file database like this.
Unfortunately I couldnt figure out how to include data from a csv into a gem so I eventually pushed it in as a giant array. 

For version 0.2.0 I want to incorparate faker to get random superhero names and secret aliases
