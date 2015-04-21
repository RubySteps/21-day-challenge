require 'set'

DICT_PATH = '/usr/share/dict/words'

def get_words_count(dict)
  count = 0
  File.open(dict) {|f| count = f.read.count("\n") }
end

def get_random_word(dict, total_words)
  number = Random.rand(total_words)
  current = 0

  File.open(dict).each_line {|x|
    if current == number
      return x.chomp.downcase
    end

    current += 1
  }
end

def print_word(word_letters, known_letters)
  word_letters.each{|l|
    print (if known_letters.include? l then l else '_' end)
  }
  puts
end

def get_letter_guess(known_letters)
  # Loop till we get a valid input
  while true
    print "Your guess: "
    guess = gets.chomp

    # Check length
    if guess.length != 1
      puts "Please enter a valid guess"
      next
    end

    if known_letters.include? guess
      puts "You have already guessed that leter"
      next
    end

    break
  end

  return guess
end

total_words = get_words_count(DICT_PATH)
random_word = get_random_word(DICT_PATH, total_words)

# Let the game begin
tries_left = 5
won = false
known_letters = []
word_letters = random_word.split('')
unique_word_letters = Set.new(word_letters)

while tries_left > 0 and won == false
  # Print the word
  print_word(word_letters, known_letters)

  # Get the guess
  guess = get_letter_guess(known_letters)

  # Check the guess
  if word_letters.include? guess
    known_letters << guess

    if known_letters.to_set == unique_word_letters
      won = true
    else
      puts "Well done!"
    end
  else
    tries_left -= 1

    if tries_left > 0
      puts "Wrong guess! #{tries_left} tries left."
    end
  end
end

puts (if won then "You've won!" else "You've lost!" end)
