require './roman_numeral'

describe RomanNumerals do

  it "should return empty string for zero" do
    expect(RomanNumerals.of(0)).to eq ""
  end
  {
    1 => "I", 
    2 => "II",
    4 => "IV",
    5 => "V",
    6 => "VI",
    9 => "IX",
    10 => "X",
    40 => "XL",
    50 => "L",
    90 => "XC",
    100 => "C",
    400 => "CD",
    500 => "D",
    900 => "CM",
    1000 => "M",
    4487 => "MMMMCDLXXXVII"

  }.each_pair do |arabic, roman|
    it "should return #{roman} for #{arabic}" do
     expect(RomanNumerals.of(arabic)).to eq roman
    end
   end
end