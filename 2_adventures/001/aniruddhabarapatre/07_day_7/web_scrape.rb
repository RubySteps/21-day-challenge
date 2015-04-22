require 'rubygems'
require 'crack'
require 'open-uri'
require 'rest-client'

# Wikipedia url to start searching for string - Nag
url = "http://en.wikipedia.org/w/api.php?action=opensearch&search=Nag&namespace=0"

puts Crack::JSON.parse(RestClient.get(url))
