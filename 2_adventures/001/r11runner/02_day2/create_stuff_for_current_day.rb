#!/usr/bin/ruby
# Creating a directory including a README for the current day in the 21-day-challange
require 'optparse'
require_relative './git_wrapper.rb'

def create_dir(path)
  Dir.mkdir(path)
  puts "Created directory: #{path}"
end

def retrieve_args
  options = {user_name: nil, day_index: nil}

  parser = OptionParser.new do|opts|
    opts.banner = "Make sure that you've forked the 21-day-challange repository with the correct username before starting this script.
Usage: create_stuff_for_current_day.rb [options]"
    opts.on('-u', '--user user', "Your GitHub user name which you're using during the challange.") do |user_name|
      options[:user_name] = user_name
    end

    opts.on('--day [INTEGER]', Integer, 'The index of the current day (1-21)') do |day_index|
      options[:day_index] = day_index
    end

    opts.on('-h', '--help', 'Displays Help') do
      puts opts
      exit
    end
  end

  parser.parse!

  if options[:user_name] == nil
    print 'Enter the user name you want to use during the challange: '
    options[:user_name] = gets.chomp
  end

  options
end

def create_dirs_and_readme(user_name, current_adventure_label)
  readme_text = "# Adventure #{current_adventure_label}

What this script does:
 - it clones the 21-day-challenge-repo from the user's fork
 - creates a branch for the current day
 - creates a directory for the current exercise within the user's personal directory,
 - writes the README-file you're reading
 - commits the directory and the README to the local repo
 - pushes the changes to GitHub
"

  personal_dir_path = File.join(Dir.pwd,user_name)
 
  current_adventure_dir_path = File.join(personal_dir_path, current_adventure_label)
  create_dir current_adventure_dir_path

  readme_path = File.join(current_adventure_dir_path,"README.md")
  File.open(readme_path,"w"){|file|
    file.write(readme_text)
  }
  puts "Created README: #{readme_path}"

end

def main
  repo_name = "21-day-challenge"
  
  args = retrieve_args
  user_name = args[:user_name]
  day_index = args[:day_index]
  day_prefix = day_index.to_s.rjust 2, "0"
  current_adventure_label = "#{day_prefix}_day#{day_index}"
  
  GitWrapper.clone_repo_from_github user_name, repo_name
  Dir.chdir repo_name
  GitWrapper.config_user user_name
  
  branch_name = "#{user_name}-#{current_adventure_label}"
  GitWrapper.create_branch branch_name
  
  Dir.chdir "2_adventures/001"
  create_dirs_and_readme user_name, current_adventure_label
  
  GitWrapper.commit_all_changes "created dir #{current_adventure_label} including README"

  GitWrapper.push_to_origin branch_name
end

main
