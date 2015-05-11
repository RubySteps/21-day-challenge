path = File.expand_path("~/code/21-day-challenge/1_warmup/patmaddox")
files = Dir[path + "/**/*"]
files = Dir[path + "/**/*"].select {|f| f.include? 'README' }
directories = files.select {|f| File.dirname(f) }
directories = files.collect {|f| File.dirname(f) }
numbered_dirs = directories.collect {|d| d.split("/").last }
numbers = numbered_dirs.collect {|d| d.to_i }
puts numbers
