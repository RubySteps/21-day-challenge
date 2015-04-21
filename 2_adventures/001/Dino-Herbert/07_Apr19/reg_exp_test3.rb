require 'open-uri'
require 'date'

url = "http://www.fangraphs.com/scoreboard.aspx"
local_file = "MLBscores" + Date.today.to_s + ".txt"

puts "\nReading from web..."

reg_exp_pat = /Baseball scoreboard for \w+, \w+ \d{2}, \d{4}/
reg_exp_pat2 = /[A-Z]+ .[0-9]+. @ [A-Z]+ .[0-9]+./ 
  
file = File.open(local_file, "w")
file2 = File.open(local_file, "a")
  
open(url).each do |line| 
  a = line.scan(reg_exp_pat) 
  b = line.scan(reg_exp_pat2)
  file.write(a)
  file2.write(b)
      
end


 
 
 


