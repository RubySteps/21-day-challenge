require 'open-uri'

class String
  def fortune_cookie
    "#{self}" + "...but maybe not."
  end
end

url = "http://www.fortunecookiemessage.com/archive.php" 

reg_exp_pat = /\.">.+\./

open(url).each do |line|

  puts line.scan(reg_exp_pat).join(" ").gsub(/^.">/, "").split("\n")
  #puts text
   
  end