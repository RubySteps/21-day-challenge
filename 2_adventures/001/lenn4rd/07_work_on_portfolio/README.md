# Day 7

Today I worked on improving my portfolio. I started with conceptual work and what information I want to include. The current version only introduces a couple of projects I had done when I created the portfolio site. For the next version I want to have an up to date overview over the projects I did, of course. I'd also like to give more information about those projects and link to demo applications. Some of them already exist as staging systems for me and my clients.

I'm not an expert with Git so I practiced the branching model. To do that I created a branch that uses Middleman 4 beta gem. What I did was:

1. Create a local branch: `git checkout -b middleman-v4`
2. In the `Gemfile`, add the Middleman GitHub repo so that Bundler uses its `master` branch:
```ruby
source 'https://rubygems.org'
gem 'middleman', github: 'middleman/middleman'
```
3. Install the bundle: `$ bundle`
4. Add and commit the changes:
```sh
$ git add .
$ git commit -m 'A nice message for this commit'
```
5. Switch back to the master branch when done: `git checkout master`

## Links

* [GitHub repo](https://github.com/lenn4rd/handwerkneu.de) for my portfolio