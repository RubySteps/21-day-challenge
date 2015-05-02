require 'open-uri'

class String
  def fortune_cookie
    "#{self}" + "...unless you don't."
  end
end

url = "http://www.fortunecookiemessage.com/archive.php" 

reg_exp_pat = /\d{4}-\w+-\w+-\w+/

open(url).each do |line|
  @text = line.scan(reg_exp_pat)
  puts @text
end

#puts @text  