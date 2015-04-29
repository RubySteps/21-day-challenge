require './kata_chop.rb'

describe "kata chop" do 

  it "should return -1  when the number 3 is not in a empty array" do
    expect(chop(3, [])).to eq -1
  end
  it "should return -1  when the number 3 is not in a sorted  array" do
    expect(chop(3, [1])).to eq -1
  end
  it "should return 0  when the number 1 is in a sorted  array" do
    expect(chop(1, [1])).to eq 0 
  end
  it "should return 0  when the number 1 is in a sorted  array" do
    expect(chop(1, [1,3,5])).to eq 0 
  end
  it "should return 1  when the number 3 is in a sorted  array" do
    expect(chop(3, [1,3,5])).to eq 1 
  end
  it "should return 2 when the number 5 is in a sorted  array" do
    expect(chop(5, [1,3,5])).to eq 2 
  end
  it "should return -1 when the number 0 is not in a sorted  array" do
    expect(chop(0, [1,3,5])).to eq -1 
  end
  it "should return -1 when the number 4 is not in a sorted  array" do
    expect(chop(4, [1,3,5])).to eq -1 
  end
  it "should return -1 when the number 6 is not in a sorted  array" do
    expect(chop(6, [1,3,5])).to eq -1 
  end
  it "should return 0  when the number 1 is in a sorted  array" do
    expect(chop(1, [1,3,5,7])).to eq 0 
  end
end
