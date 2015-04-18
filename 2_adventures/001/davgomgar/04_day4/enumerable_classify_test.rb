 require 'minitest/autorun'
 require './enumerable_classify'

 class ClassifyTest < MiniTest::Test
   def setup
     @words = %w(one two three four five six seven eight nine)
   end
   def test_count_vowels 
      result = {2=>["one", "three", "four", "five", "seven", "eight", "nine"], 1=>["two", "six"]}
      assert_equal result, @words.classify{|word| word.count("aeiou")} 
   end
   def test_classification_by_lenght
     result = {3=>["one", "two", "six"], 5=>["three", "seven", "eight"], 4=>["four", "five", "nine"]}
     assert_equal result, @words.classify{|word| word.length}
   end
 end