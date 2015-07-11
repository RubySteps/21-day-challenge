cipher_text = "the quick brown fox jumps over the lazy dog"

frequency_analysis = cipher_text.split(//).sort.each_with_object(Hash.new(0)) { |letter, occurrences| occurrences[letter] += 1 }

puts dictionary
