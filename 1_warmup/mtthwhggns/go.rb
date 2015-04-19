#!/usr/bin/env ruby

# As the task is to create files and directories
# `/1_warmup/<your-github-username>/01/README.md`, this is written to be run
# from `/1_warmup/<your-github-username>`. It doesn't look like most people are
# using Ruby for this, but I don't enjoy anything too easy!

require 'fileutils'
[1, 2].each do |i|
  directory_name = i.to_s.rjust(2, '0')
  FileUtils.mkdir directory_name
  filename = "#{directory_name}/README.md"
  readme_file = File.new(filename, 'w')
  readme_file.puts "## Hello, challenge! This is readme number #{i}"
  readme_file.close
end
