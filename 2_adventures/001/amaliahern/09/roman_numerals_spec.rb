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
end
