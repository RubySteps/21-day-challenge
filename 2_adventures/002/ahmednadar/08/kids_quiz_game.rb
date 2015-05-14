answer = " "
puts " Welcome to the Nada and bilal quiz game"

puts "=======" *5 
puts "What is your name"
name = gets.chomp
puts "Welcome to the game " + name.upcase
puts "-----" * 6
score = 0
puts "Your current score is " + score.to_s
puts  "-----" * 6

# question 1

until  answer == "A"
  puts "Question 1 - Where is Polar Bear's home?\n A: Africa \n B: Arctic \n C: Europe \n D:South Pole " 
  puts 'What is your answer?'
  answer = gets.chomp
  if answer != "A"
    puts "I'm sorry, that's the wrong answer, try again"
  end
end

puts "*** " * 6
puts 'Correct - Well done!!!'
puts "*** " * 6
puts " "

score = score + 1
puts 'You current score now is ' + score.to_s
answer = " "
puts " "

# question 2

until  answer == "C"
  puts "Question 2 - I have four legs, bur can't walk, What Am I ?\n A: Snail  \n B: FLy  \n C: Chair \n D: Turtle " 
  puts 'What is your answer?'
  answer = gets.chomp
  if answer != "C"
    puts "I'm sorry, that's the wrong answer, try again"
  end
end

puts "*** " * 6
puts 'Correct - Well done!!!'
puts "*** " * 6
puts " "

score = score + 1
puts 'You current score now is ' + score.to_s
answer = " "

puts " "

# question 3

until  answer == "D"
  puts "Question 3 - You can chop it, punch it, beat it, threw it away. But it won't get hurt. What it is? \n A: Snail \n B: Air  \n C: Nothing \n D: Water  " 
  puts 'What is your answer?'
  answer = gets.chomp
  if answer != "D"
    puts "I'm sorry, that's the wrong answer, try again"
  end
end

puts "*** " * 6
puts 'Correct - Well done!!!'
puts "*** " * 6
puts " "

score = score + 1
puts 'You current score now is ' + score.to_s
answer = " "

