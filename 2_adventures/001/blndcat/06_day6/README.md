# Day 6

The most basic of RSpec examples.  Basically just getting it up and running and doing a smoke test.
The purpose is to practice this so that it is so natural so that any ruby program I write will start this way.

Most of this is basic kata is derived from http://blog.codeship.com/install-rspec-tutorial/
except that that article is a little out of date so some things changed in the mean time.  

Here is a record of what I did

mkdir ruby-app
cd ruby-app

vi Gemfile

added line:
gem 'rspec' 
but also added line:
source 'https://rubygems.org'

vi .ruby-version
set it to 2.1.5
(no particular reason apart from I use many versions and know I have bundler installed for 2.1.5)

ran bundle command which installed 4 gems (RSpec 3.2.3)

ran rspec but unlike in the article there were no complaints

created spec and lib dir anyway
created .rspec file and added --color option

since no complaints, went on with article so that complaints would come :)

vi spec/app_spec.rb

added lines from test example in the article but changed the assertion to RSpec 3 expect style i.e.

instead of App.launch.should be_true
I used expect(App.launch).to be true

ran rspec
got uninitialized constant App

so create App class by 
vi lib/app.rb
and adding lines
class App
end

ran rspec
still complains (as the article said it would)
so add require 'app' to the spec file

ran rspec
next error indicates we need a launch class method
so added these lines inside the App class
def self.launch
end

ran rspec
got a expected true got nil error

so added the line
true
inside the self.launch method

ran rspec
got green pass

[finished]

In my next run through this kata, I think I will lock down the version of RSpec in the Gemfile
and also set-up Guard so that I can do the cycle faster
