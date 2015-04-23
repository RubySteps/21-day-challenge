def arabicRomanConverter(number)
 roman = ""
 if number = 4 
  roman = "IV"
 else
   for i  in 1..number
     roman += "I"
   end
 end
 roman
end
