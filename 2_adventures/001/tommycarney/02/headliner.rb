require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("http://www.nytimes.com/"))
headings = []
edited_headings = []
page.css("h2.story-heading").each do |heading|
		headings << heading.text
end

headings.map do |heading|
	heading.slice!("NYT Now")
	heading.gsub!("\n", " ")
	heading.strip!
	edited_headings << heading
end

puts edited_headings

File.open('test.txt', 'w') do |content|
	content.puts edited_headings
end

