require "open-uri"

puts "Please enter your name"
print ">"
name = gets.chomp

remote_url = "https://www.cs.cmu.edu/~spok/grimmtmp/016.txt"

open(remote_url, "r") do |f| 
  f.readlines.each do |line|
    line.gsub! 'Cinderella', name
    line.gsub! 'cinderella', name
    puts line
  end
end