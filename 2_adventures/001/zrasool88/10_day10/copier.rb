#!/usr/bin/env ruby

file_to_backup = ARGV.shift

backup_file = file_to_backup + '.backup'

`cp #{file_to_backup} ./#{backup_file}`
