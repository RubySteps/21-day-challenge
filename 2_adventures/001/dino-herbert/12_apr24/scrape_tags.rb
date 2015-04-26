require 'open-uri'

sites = ["http://www.chess.com", "http://chessgames.com", "http://chesstempo.com"]
tags = ["div", "h1", "h2", "h3", "img"]

def get_page(url)
  open(url).read
end

def count_tags(page, tag)
  pattern = /<#{tag}\b/
  num_tags = page.scan(pattern)
  num_tags.length
end

sites.each do |url|
  puts "#{url} has:"
  tags.each do |tag|
    page = get_page(url)
    tag_count = count_tags(page, tag)
    puts "\t #{tag_count} <#{tag}> tags"
  end
end