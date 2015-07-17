# Cool, one-line solution.
# Remarks:
#  1. hard to read.
#  2. creating new vowel array on each iteration.
def vowel_count_1(string)
  string.split("").inject(0) { |vowels, letter| ["a", "e", "i", "o", "u"].include?(letter.downcase) ? vowels + 1 : vowels }
end

# My real solution.
def vowel_count_2(string)
  vowels = ["a", "e", "i", "o", "u"]
  string.split("").inject(0) do |vowel_count, letter|
    vowels.include?(letter.downcase) ? vowel_count + 1 : vowel_count
  end
end

# Best solutio on Codewars. Using String#count method.
def vowel_count_3(string)
  string.count("aeiou")
end

string = "Think good, do good."
vowel_count_1(string) # => 6
vowel_count_2(string) # => 6
vowel_count_3(string) # => 6
