require "rubygems"
require "json"
require "yaml"

# YAML
yaml_file = YAML.load_file('countries.yml')

puts "==="  * 10
puts "YAML file "
puts "==="  * 10

yaml_file.each do |country|
  name = country["name"]
  code = country["code"]
  
  puts "#{name} code is: '#{code}'"
  puts "......."  * 5
end

# JSON
json = File.read('countries.json')
all_countries = JSON.parse(json)

puts "===" * 10
puts "JSON file "
puts "==="  * 10

all_countries.each do |country|
  name = country["name"]
  code = country["code"]
  puts "#{name} code is => '#{code}'"
end
