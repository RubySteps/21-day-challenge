require_relative '../../03_day3/primes.rb'

describe "#prime_number?" do
  context "given a prime number" do
    it "should return true" do
      expect(prime_number?(3)).to eq(true)
    end
  end

  context "given a composite number" do
    it "should return false" do
      expect(prime_number?(2)).to eq(false)
    end
  end

  context "given 1" do
    it "should return false" do
      expect(prime_number?(1)).to eq(false)
    end
  end

  context "given 0" do
    it "should return false" do
      expect(prime_number?(0)).to eq(false)
    end
  end
end