def arabicRomanConverter(number, hash =[ ["X", 10] ,["IX",9] ,["V",5], ["IV",4], ["I",1] ])
  roman = ""
  hash.each do |key,value|
    while number >= value 
      roman += key 
      number = number- value 
    end
  end
  roman
end
