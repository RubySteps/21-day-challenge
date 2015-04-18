require 'rubygems'
# get gem at https://github.com/tj/google-search
require 'google-search'

def find_resources(query)
  search = Google::Search::Web.new(:query=>query,size: :large)
  response = search.find.map {|item| item.uri}
end

results = []
results << find_resources("site:mydomain.com inurl:filename")
results << find_resources("site:mydomain.com document content")
results << find_resources("site:mydomain.com inurl:file.extension")
# ...

uris = results.flatten.uniq

puts uris.count
uris.each{|uri| puts uri}
