#!/usr/bin/env ruby

# archive = ARGV.shift

# backup_archive = archive + '.backup'

# `unzip #{archive}`
# `cp #{archive} ./#{backup_archive}`
# `rm #{archive}`

directory_with_archive = Dir.new("/Users/forsee/Downloads/Software")
array_of_files_from_directory = Array.new(directory_with_archive.entries)



