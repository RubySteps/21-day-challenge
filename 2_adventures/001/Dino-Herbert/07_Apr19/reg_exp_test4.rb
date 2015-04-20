require 'open-uri'
require 'date'

url = "http://www.fangraphs.com/scoreboard.aspx"
local_file = "MLBscores" + Date.today.to_s + ".txt"

puts "\nReading from web.."

reg_exp_pat = /Baseball scoreboard for \w+, \w+ \d{2}, \d{4}/
reg_exp_pat2 = /[A-Z]+ .[0-9]+. @ [A-Z]+ .[0-9]+./ 
  
file = File.open(local_file, "w")
file2 = File.open(local_file, "a")
  
open(url).each do |line| 
  file.puts line.scan(reg_exp_pat) 
  file2.puts line.scan(reg_exp_pat2)
end

