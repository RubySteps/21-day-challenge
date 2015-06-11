### Rubysteps 21 Day Challenge (2015-06 003)

#### Day 08
Almost a whole day wasted trying to get Yosemite to appear in my wifi network (without success). My intention was to have the mac serve the rails app to the phone (so I could work with the layout).

Here's hoping 10.10.4 Yosemite's update fixes things.

##### Updates
I've been working (alongside advice and tips from Victor Goff) on:

1. Learning the devise gem for authentication purposes. Remember that authentication process that took forever to roll out in the Rails Tutorial? Well, devise makes it insanely easy to abstract away. It allows you to have an authenticated app in 15 minutes, so that you can start working on the app itself.
Quite nifty gem!

2. Convos on the use of Github Flow vs. Git Flow. For this project, we've somewhat settled on Git Flow (using a *dev* branch). I still think though that working on feature branches and pulling into master, while a bit risky (you can mess up something that is deployed indeed), still is better than having stuff lying around waiting for deployment (out of fear).

3. I also learned how to use ImageMagick to pad a thumbnail (if the image is rectangular or something). This should come in quite handy for when I start processing uploads in the rails app.

##### Resources
- [209 Devise - revised](http://railscasts.com/episodes/209-devise-revised)
- [User Authentication with Devise](https://gorails.com/episodes/user-authentication-with-devise)
- [Devise Wiki - Getting Started](https://github.com/plataformatec/devise#getting-started)
- [A successful Git branching model](http://nvie.com/posts/a-successful-git-branching-model/)
- [GitHub Flow](http://scottchacon.com/2011/08/31/github-flow.html)
- [Pad Out the Thumbnail](http://www.imagemagick.org/Usage/thumbnails/#pad)
