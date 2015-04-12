require 'net/http'
require 'json'

res = JSON.parse(Net::HTTP.get(URI 'https://api.github.com/users/skahlert'))
res.each do |key,value|
  puts "#{key.capitalize}:\n  #{value}"
end
