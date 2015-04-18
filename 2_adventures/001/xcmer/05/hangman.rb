require 'set'

DICT_PATH = '/usr/share/dict/words'

def get_words_count(dict)
  count = 0
  File.open(dict) {|f| count = f.read.count("\n") }
end

def get_random_word(dict, total_words)
  number = Random.rand(total_words)
  current = 0

  File.foreach(dict) {|x|
    if current == number
      return x.chomp.downcase
    end

    current += 1
  }
end

def print_word(word_letters, known_letters)
  word_letters.each{|l|
    if known_letters.include? l
      print l
    else
      print '_'
    end
  }
  puts
end

total_words = get_words_count(DICT_PATH)
random_word = get_random_word(DICT_PATH, total_words)

# Let the game begin
tries = 5
known_letters = []
word_letters = random_word.split('')
unique_word_letters = Set.new(word_letters)

while true
  print_word(word_letters, known_letters)
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

  # We have a guess
  if word_letters.include? guess
    known_letters << guess

    if known_letters.to_set == unique_word_letters
      puts "You've won!"
      break
    else
      puts "Well done!"
    end
  else
    tries -= 1

    if tries == 0
      puts "You've lost."
      break
    else
      puts "Wrong guess! #{tries} tries left."
    end
  end

end
