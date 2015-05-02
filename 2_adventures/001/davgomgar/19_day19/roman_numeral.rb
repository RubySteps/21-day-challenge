module RomanNumerals
  CONVERSION = [
    [1000, "M"],
    [900, "CM"],
    [500, "D"],
    [400, "CD"],
    [100, "C"],
    [90, "XC"],
    [50 , "L"],
    [40, "XL"],
    [10,  "X"],
    [9, "IX"],
    [5, "V"],
    [4, "IV"],
    [1, "I"]
  ]
  def self.of(in_arabic)
    return "" if in_arabic.zero?
    arabic, roman = conversion_factors_for(in_arabic) 
    roman + of(in_arabic - arabic) 
  end

  def self.conversion_factors_for(in_arabic)
    CONVERSION.find {|arabic, _| arabic <= in_arabic}
  end
end
