require 'rss'

github = 'https://github.com/'
username = ARGV[0] || 'phonbopit'
url = "#{github}#{username}.atom"
filename = ARGV[1] || 'data.txt'

content = ''

feed = RSS::Parser.parse(url)
title = feed.title.content

content += title + "\n"
content += '-' * 20 + "\n"

feed.entries.each do |item|
  content += "#{item.title.content} on #{item.published.content.to_time}\n\n"
end

File.open(filename, 'w') { |f| f.write(content) }
puts "Saving data in #{filename}"


