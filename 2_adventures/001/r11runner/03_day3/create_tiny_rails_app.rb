#!/usr/bin/ruby
# creating a tiny Rails app for practicing

require 'optparse'
require_relative './git_wrapper.rb'
require_relative './rails_wrapper.rb'

def retrieve_args
  options = {user_name: nil, day_index: nil, port: 3000}

  parser = OptionParser.new do|opts|
    opts.banner = "Usage: create_tiny_rails_app.rb [options]"
    opts.on('-a', '--app app_name', 'The name of the app you want to generate') do |app_name|
      options[:app_name] = app_name
    end

    opts.on('-p', '--port port', Integer, 'The port where you want to start your app. Default: 3000') do |port|
      options[:port] = port
    end

    opts.on('-u', '--user user', "The user name you want to pass for git config. Optional") do |user_name|
      options[:user_name] = user_name
    end
    
    opts.on('-h', '--help', 'Displays Help') do
      puts opts
      exit
    end
  end

  parser.parse!

  if options[:app_name] == nil
    print 'Enter the app name you want to generate: '
    options[:app_name] = gets.chomp
  end

  options
end

def main
  args = retrieve_args
  app_name = args[:app_name]
  user_name = args[:user_name]
  
  RailsWrapper.create_app app_name
  app_path = File.join Dir.pwd, app_name
  
  Dir.chdir app_name
  GitWrapper.init
  if !(user_name.nil?)
    GitWrapper.config_user user_name
  end
  GitWrapper.commit_all_changes "initial commit: empty Rails app"

  RailsWrapper.generate_scaffold "Project", "title:string description:text"
  RailsWrapper.generate_scaffold "Bug", "title:string description:text project:references"

  RailsWrapper.add_has_many "Project", "bugs"

  #TODO: make it configurable so that it isn't specific for my environment
  if user_name == "r11runner"
    system "gnome-terminal --working-directory=#{app_path}"
  end
  
  RailsWrapper.start_server args[:port]
end

main
