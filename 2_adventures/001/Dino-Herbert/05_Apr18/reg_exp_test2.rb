require 'open-uri'

pattern = /Baseball scoreboard for \w+, \w+ \d{2}, \d{4}/
pattern2 = /[A-Z]+ .[0-9]+. @ [A-Z]+ .[0-9]+./

puts "\nReading from web..."

open("http://www.fangraphs.com/scoreboard.aspx").each do |line| 
  puts line.scan(pattern) 
  puts line.scan(pattern2)
  
  
  
end




