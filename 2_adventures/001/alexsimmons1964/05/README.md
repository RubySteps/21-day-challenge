So it's day 5 of this challenge and I haven't looked at any form of coding yet.

I had hoped to try using someone else's code as a way to learn about how you do that e.g.
download it, or copy it, or whatever the right terminology is, and somehow and make it
run on my computer, but I am not sure how to go about that. Well not yet.
 
So I asked the Gitterati (I just made that up) and of course got some helpful replies 
which required use of commands I was not familiar with or understood.

I looked up the Git documentation to read up on these commands, and of course the 
documentation uses words and phrases in the definitions that I also don't understand.

This pattern of assumed prior knowledge of terminology I'm finding to be a common theme 
at this stage of my sizeable ignorance. I look up some of those and the references start 
to become a bit circular. 

Slowly, enough context is formed that a term starts to makes sense and I think I get it.

Here's an example of what I mean. From the git documentation for git-push:

	NAME
	git-push - Update remote refs along with associated objects

that's the first line of the definition. 

In the context of my current level of knowledge, the only words in that line I probably 
understand are "along with", and that's possibly a brave assumption on my part because 
I'm assuming these are used in their regular English sense, and not some special 
programming/git code sense. 

IOW I'm assuming that each of:
- Update
- remote
- refs
- associated objects

have a specific meanings in git land.

It goes on:

	DESCRIPTION
	Updates remote refs using local refs, while sending objects necessary to complete the given refs.

So this next paragraph is also dominated by terms with git meanings I'm yet to understand:
- update
- remote refs
- local refs
- sending
- objects
- complete
- given refs

In this case I'm assuming the other words have their regular use English meaning but one 
can never be sure.

This is why the documentation is frustrating to read.


Yesterday I went through a git tutorial which used "octocats" as their example:
https://try.github.io/levels/1/challenges/1

It was OK but like many tutorials - I followed the instructions without really gaining an 
understanding of what the commands really do or why they are structured the way they are 
or indeed why I'd use them or need them. Some of it is explained but many commands are 
provided in a "do this" manner, rather than explaining why.

I like to understand why something works the way it does, why I would use it, as much as 
the fact that it works and does what's assumed to be needed.

So that then took me off on another branch of discovery about git, and I ended up 
watching a 100-minute long video called "Git for Ages 4 and up",
https://www.youtube.com/watch?v=1ffBJ4sVUb4
which was pretty good as it provided a visual representation of what's going on. It would 
have been much better had there not been lots of inaudible questions interrupting the 
flow of the talk.

I like such visual models or representations, they make sense to me (when they are valid 
models and we are operating within the domain of validity), which possibly explains why I 
like making charts - I like graphical representations of systems and data, and why 
terminal windows tend leave me a bit cold.

The physical model of the nodes and (one-way) connections, explanation of IDs and the 
attached names which explained things like branches, Master, HEAD, branch names, how one 
navigates and what's really happening (like not much sometimes, just a label or two gets 
moved).

It did however get a little messy in my mind when discussing the concept of a remote 
cloned repository, and how these related to each other. I followed the logic of the ID
comparison between each and how that is used to decide what to copy over, but Push and
Pull - I'm still not quite getting those yet.

All in good time.