def arabicRomanConverter(number, hash = {1 => "I", 4 => "IV", 5 => "V"})
  roman = ""
    if number == 4
      roman = hash[number]
    elsif number == 5
      roman = hash[number]
    elsif number < 4 
      for i  in 1..number
         roman += "I"
      end
    end
 roman
end
