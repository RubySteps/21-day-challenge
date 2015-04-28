require './palindrome.rb'

describe "Palindromes" do

  context "Lowercase strings" do
    it "abracadabra is not a palindrome" do
       expect("abracadabra").to_not be_palindrome
     end

    it "aaa is a palindrome" do
      expect("aaa").to  be_palindrome
    end

    it "dabale arroz a la zorra el abad is a palindrome" do
      expect("dabale arroz a la zorra el abad").to be_palindrome
    end
  end

  context "Upcase strings" do
    it "ABRACADABRA is not a palindrome" do
       expect("ABRACADABRA").to_not be_palindrome
    end

    it "AAA is a palindrome" do
      expect("AAA").to  be_palindrome
    end

    it "DABALE ARROZ A LA ZORRA EL ABAD is a palindrome" do
      expect("DABALE ARROZ A LA ZORRA EL ABAD").to be_palindrome
    end
  end

  context "Upcase strings" do
    it "ABRAcadaBRA is not a palindrome" do
       expect("ABRAcadaBRA").to_not be_palindrome
    end

    it "AAa is a palindrome" do
      expect("AAa").to  be_palindrome
    end

    it "DABALE arroz A la ZORRA el ABAD is a palindrome" do
      expect("DABALE arroz A la ZORRA el ABAD").to be_palindrome
    end
  end
  
end
