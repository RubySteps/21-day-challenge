require 'rubygems'
require 'restclient'
require 'crack'

url = "http://en.wikipedia.org/w/api.php?action=opensearch&namespace=0&suggest=&search="

('A'..'Z').to_a.each do |letter|
  response = RestClient.get("#{url}#{letter}", 'User-Agent' => 'Ruby') 
  parsed_response = Crack::JSON.parse(response)
  puts parsed_response.join(', ')
  sleep 0.5
end
