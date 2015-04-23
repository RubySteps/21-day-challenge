class Hangman 

    def set_up_game
        @str = @str.split("")
        @str.length.times do 
            @guessed_letters << "_"
        end
    end

    def make_guess guess
        if @str.include?(guess)
            @str.each.with_index do |item, idx|
                if item == guess
                  @guessed_letters[idx] = @str[idx]
                end
            end
            true
        else
            false
        end
    end

    def turn
        puts "Choose a letter:"
        print ">"
        guess = gets.chomp
        if make_guess guess
            puts "Good job!"
        else
            puts "Not in there"
        end
        puts @guessed_letters.join(" ")
        puts ""
    end

    def init(str)
        @str = str.downcase
        @guessed_letters = []
        set_up_game
        until (@guessed_letters == @str)
            turn
        end
        puts "Congrats!"
    end

end

hangman = Hangman.new

puts "Choose a word:"
print ">"
word = gets.chomp
hangman.init(word)
