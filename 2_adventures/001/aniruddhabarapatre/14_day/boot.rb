require "sinatra"
require "sinatra/activerecord"
require "protected_attributes"

set :bind, '0.0.0.0'
set :server, 'webrick'

# Go through each of the files in the listed directories and automatically
# # require all .rb files (including sub directories). Saves us having to
# # manually require these all the time.
["models"].each do |target|
  Dir[File.dirname(__FILE__) + "/#{target}/**/*.rb"].each do |file| 
    puts "including #{file}"
    require file
  end
end
