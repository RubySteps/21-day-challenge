#!/usr/bin/env ruby
require 'fileutils'

current_directory = File.expand_path(File.dirname(__FILE__))
next_directory    = current_directory.succ
next_script_path  = File.join(next_directory, File.basename(__FILE__))

FileUtils.mkdir_p next_directory
FileUtils.cp File.expand_path(__FILE__), next_script_path
