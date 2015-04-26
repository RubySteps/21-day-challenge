## RubySteps 21-Day Challenge: Day 8

I’m working on a program that pulls data from the database of an existing Rails application and munges it with Ruby and R into line and bar charts in PDF format.

I will likely create an API in the current application rather than directly connecting to the database, but for today, I’ve create a class that sets up the database connection given the Rails environment and the path to the database.yml file.
