require 'pathname'
require 'fileutils'

# Gets folder as a directory object so I can get specific info from it
path = Dir.new("/Users/zb/Downloads/test_path/")
# Saves pathname as string so it can be used later
path_s = Pathname.new("/Users/zb/Downloads/test_path/")
# Saves the source file which I want to copy later
copy_me = path.entries[2]
# Gets all file entries in path object and removes unneeded entries
filenames = path.entries.drop(3)

# Modifies the filename strings to replace txt with rdc
filenames.each do |f|
  f.sub! 'txt', 'rdc'
end

# Copies the source file to the same directory and renames the file with the string from the filenames array
filenames.each do |f|
  FileUtils.cp "#{path_s}#{copy_me}","#{path_s}#{f}"
end
