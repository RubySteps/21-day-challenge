class Game

	def get_player_move
		puts "Pick 'rock', 'paper', or 'scissors'"
		print ">"
		@user_choice = gets.chomp
		@user_choice.downcase!
		unless @user_choice == 'rock' || @user_choice == 'paper' || @user_choice == 'scissors'
			get_player_move
		end
	end

	def get_computer_move
		random_number = rand(3)

		case random_number
		when 0
			@computer_choice = "rock"
		when 1
			@computer_choice = "scissors"
		else
			@computer_choice = "paper"
		end
	end

	def get_winner
		if @user_choice == @computer_choice 
		    @winner = "tie"
		elsif @user_choice == "rock" && @computer_choice == "scissors"
	        @winner = "user"
		elsif @user_choice == "scissors" && @computer_choice == "paper"
			@winner = "user"
		elsif @user_choice == "paper" && @computer_choice == "rock" 
	    	@winner = "user"
	    else
	    	@winner = "computer"
	    end
	end

	def puts_winner
		if @winner == "tie"
			puts "You chose #{@user_choice}. The computer chose #{@computer_choice}. It is a tie!"
		elsif @winner == "user"
			puts "You chose #{@user_choice}. The computer chose #{@computer_choice}. You win!"
		else
			puts "You chose #{@user_choice}. The computer chose #{@computer_choice}. Computer wins!"
		end
	end

	def play
		get_player_move
		get_computer_move
		get_winner
		puts_winner
	end
	
end

game = Game.new
game.play