require 'yaml'

data = YAML.load_file('players.yml')

data.each do |player|
  name = player["name"]
  age = player["age"]
  position = player["position"]
  club = player["club"]
  puts "#{name}, #{age}, #{position}, #{club}"
  puts "----"  * 5
end