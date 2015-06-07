def check_the_thing(path)
  path        = File.expand_path path
  files       = look_up_readme_files_within_path path
  directories = get_directories_containing_readmes files

  convert_directories_to_numbers directories
end

def look_up_readme_files_within_path(path)
  Dir[path + "/**/*"].select {|f| f.include? 'README' }
end

def get_directories_containing_readmes(files)
  files.collect {|f| File.dirname(f) }
end

def convert_directories_to_numbers(directories)
  directories.collect {|d| d.split("/").last }.collect {|d| d.to_i }
end

def check_warmup
  check_the_thing "~/code/21-day-challenge/1_warmup/patmaddox"
end

def check_days_work
  check_the_thing "~/code/21-day-challenge/2_adventures/001/patmaddox"
end
