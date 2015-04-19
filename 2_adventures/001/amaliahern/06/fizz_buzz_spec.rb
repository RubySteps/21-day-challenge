require 'minitest/autorun'
require './fizz_buzz.rb'

describe "fizz_buzz kata" do
  it "should return fizz when number is divisible by 3" do
    expect(fizzbuzz(3)).to eq "fizz" 
  end
  it "should return buzz when number is divisible by 5" do
    expect(fizzbuzz(5)).to eq "buzz"
  end
  it "should return fizzbuzz when number is divisible by 3 & 5" do
    expect(fizzbuzz(15)).to eq "fizzbuzz"
  end
  it "should return number when is not fizz buzz" do
    expect(fizzbuzz(8)).to eq 8 
  end
  it "should return number when it is 1" do
    expect(fizzbuzz(1)).to eq 1
  end
end
