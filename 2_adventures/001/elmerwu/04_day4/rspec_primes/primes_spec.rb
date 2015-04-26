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

describe "#nth_prime" do
  context "given 0" do
    it "should return 'Please enter a number 1 or greater'" do
      expect(nth_prime(0)).to eq("Please enter a number 1 or greater")
    end
  end

  context "given 1" do
    it "should return 2" do
      expect(nth_prime(1)).to eq(2)
    end
  end

  context "given 2" do
    it "should return 3" do
      expect(nth_prime(2)).to eq(3)
    end
  end

  context "given 9" do
    it "should return 23" do
      expect(nth_prime(9)).to eq(23)
    end
  end

  context "given 100" do
    it "should return 541" do
      expect(nth_prime(100)).to eq(541)
    end
  end
end