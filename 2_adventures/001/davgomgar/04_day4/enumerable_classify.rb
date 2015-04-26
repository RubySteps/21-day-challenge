module Enumerable
  def classify(&block)
    hash = {}
    self.each do |element|
      result = block.call element
      hash[result] ||=[]
      hash[result] << element
    end
    hash
  end
end

words = %w(one two three four five six seven eight nine)
puts words.classify{|word| word.count("aeiou")}
puts words.classify{|word| word.length}