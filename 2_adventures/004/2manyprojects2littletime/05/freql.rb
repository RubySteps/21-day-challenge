entry = "the quick brown fox jumps over the lazy dog"

dictionary = entry.split(//).sort.each_with_object(Hash.new(0)) { |letter, occurrences| occurrences[letter] += 1 }

puts dictionary
