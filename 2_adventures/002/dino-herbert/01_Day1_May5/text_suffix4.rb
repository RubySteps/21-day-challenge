require 'open-uri'

class String
  def fortune_cookie
    "#{self}" + "...but maybe not."
  end
end

url = "http://www.fortunecookiemessage.com/archive.php" 

reg_exp_pat = /\.">.+\./

open(url).each do |line|
  text = line.scan(reg_exp_pat)
  puts text.join(" ").gsub(/^.">/, "").fortune_cookie
  end