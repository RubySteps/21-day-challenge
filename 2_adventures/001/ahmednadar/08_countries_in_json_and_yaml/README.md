## Day 8: 

### Read YAML and JSON

Read and parse YAML and JSON files in Ruby.

##### YAML:
```ruby
yaml_file = YAML.load_file('countries.yml')

yaml_file.each do |country|
  name = country["name"]
  code = country["code"]
  
  puts "#{name} code is: '#{code}'" #=> Uruguay code is: 'UY'
end
```
##### JSON:
```ruby
json_file = File.read('countries.json')
all_countries = JSON.parse(json_file)

all_countries.each do |country|
  name = country["name"]
  code = country["code"]
  puts "#{name} code is => '#{code}'" #=> Finland code is: 'FI'
end
```


### Tools
- Convert JSON to YAML [http://jsontoyaml.com/](http://jsontoyaml.com/)
- Convert YAML to JSON [http://yamltojson.com/](http://yamltojson.com/)
