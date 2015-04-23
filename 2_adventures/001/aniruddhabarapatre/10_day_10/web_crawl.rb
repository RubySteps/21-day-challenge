require 'rubygems'
require 'nokogiri'
require 'open-uri'

base_url = "http://en.wikipedia.org"
list_url = "#{base_url}/wiki/List_of_Nobel_laureates"
page = Nokogiri::HTML(open(list_url))

# Getting list of Nobel laureates
rows = page.css("div.mw-content-ltr table.wikitable tr")

rows[1..-2].each do |row|
  # Remove listing who don't have wiki page
  hrefs = row.css("td a").map{ |a|
    a['href'] if a['href'].match("/wiki/")
  }.compact.uniq

  hrefs.each do |href|
    puts "#{href}"
  end
end
