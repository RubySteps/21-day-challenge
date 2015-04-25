require './roman_numerals.rb'
describe "roman numerals" do 

  it "should return I when the number is 1" do
    expect(arabicRomanConverter(1)).to eq "I"
  end
  it "should return II when the number is 2" do
    expect(arabicRomanConverter(2)).to eq "II"
  end
  it "should return III when the number is 3" do
    expect(arabicRomanConverter(3)).to eq "III"
  end
  it "should return IV when the number is 4" do
    expect(arabicRomanConverter(4)).to eq "IV"
  end
  it "should return V when the number is 5" do
    expect(arabicRomanConverter(5)).to eq "V"
  end
  it "should return VI when the number is 6" do
    expect(arabicRomanConverter(6)).to eq "VI"
  end
  it "should return VII when the number is 7" do
    expect(arabicRomanConverter(7)).to eq "VII"
  end
  it "should return VIII when the number is 8" do
    expect(arabicRomanConverter(8)).to eq "VIII"
  end
  it "should return IX when the number is 9" do
    expect(arabicRomanConverter(9)).to eq "IX"
  end
  it "should return X when the number is 10" do
    expect(arabicRomanConverter(10)).to eq "X"
  end
end
