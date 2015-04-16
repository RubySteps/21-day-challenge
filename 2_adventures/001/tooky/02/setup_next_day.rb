#!/usr/bin/env ruby
require 'fileutils'

current_directory = File.expand_path(File.dirname(__FILE__))
next_directory    = current_directory.succ

FileUtils.cp_r current_directory, next_directory
FileUtils.rm File.join(next_directory, "README.md")
