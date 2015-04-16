#!/usr/bin/env ruby
require 'fileutils'

current_directory = File.expand_path(File.dirname(__FILE__))
next_directory    = current_directory.succ
day_number        = File.basename(next_directory)

FileUtils.cp_r current_directory, next_directory
File.truncate File.join(next_directory, "README.md")

`git reset && git add #{next_directory} && git commit -m "Start day #{day_number}"`

puts "Done!"
