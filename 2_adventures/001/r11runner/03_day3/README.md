# Adventure 03: Rails practice app generator

After automating the daily exercise of the 21-day-challenge, I was wondering which other tasks I'm doing quite often. Since reading the 1st chapter of [Practicing Rails](https://www.justinweiss.com/practicing-rails/) from [Justin Weiss](http://www.justinweiss.com/) I create tiny practice apps, whenever I'm trying to lesomething new in Rails. So it seemed to be logical to try to automate this.

As Justin points out, you can really quickly create a tiny Rails application with some scaffolds. But you can do it even quicker with a script :)

What does this script do?
 - creates a Rails application
 - initializes a git repository
 - generates 2 scaffolds: Project (title, description), Bug (title, description) where a project has many bugs
 - migrates the db
 - starts the Rails server

What is missing?
 - passing options to rails new
 - set up test data
 - further suggestions??

### Why git?
I prefer using git even for throw-away code. Of course, I'm not going to push such projects to GitHub, but if it turns out that I completely misunderstood sth, it's great to have the possibility of git reset --hard

### Why bugs?
 - It's used in Practicing Rails as an example.
 - Software-developers know this domain really well :-)
Of course, it's possible that you have to introduce further attributes or even further models depending on what you're trying out. But bugs and projects are a good starting point most of the time.

In Practicing Rails, Justin explicitly suggests to create practice applications with the same models again and again. That way, you can really concentrate on the technical topic you're discovering.

### Why practice apps at all?
 - They let you try out new stuff in isolation.
 - This way the danger that you're doing some trouble in your "real" application gets smaller.
For further reasoning and for tips how to use the practice apps most effectively, I encourage you to read the whole chapter: Tiny Apps: The best way to study new Rails ideas
