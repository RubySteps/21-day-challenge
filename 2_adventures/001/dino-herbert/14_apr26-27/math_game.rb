def game
a = rand(10)
b = rand(10)

puts "What is #{a} + #{b}?"
ans = a + b
    
answer = gets.chomp
answer = answer.to_i
   
  if answer == ans
    puts "You are correct"
  else
    puts "Guess again"
  end
end
  
game