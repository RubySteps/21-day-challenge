def ask
  puts "\nWanna play a math game? Y or N"
  @response = gets.chomp.upcase
  play_game
end

def play_game
  if @response == "Y"
    guess
  else
    puts "\nSee ya later"
    #return
  end
end
  
def guess
  a = rand(20)
  b = rand(20)

  puts "\nWhat is #{a} + #{b}?"
  ans = a + b
          
  answer = gets.chomp
  answer = answer.to_i
         
  if answer == ans
    puts "\nYou are correct!"
    ask
  else
    puts "\nSorry.  Guess again :-("
    ask
  end
end

ask