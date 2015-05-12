scoreCount = 0
scoreTotal = 0

puts "\nTest Score Average Calculator\n"
puts "\nPlease input test scores that range between 0 and 100.\n"
puts "Input the number 999 to end."

score = gets.chomp.to_f

if ((score < 0 || score > 100) && score != 999)
  puts "Please input a number ranging from 0 to 100."
  end
  
while (score <= 100 && score >= 0)
  scoreCount += 1
  scoreTotal += score
  puts "Input score:  "
  score = gets.chomp.to_f
  end
  
  avgScore = scoreTotal / scoreCount

puts "Score count:\t#{scoreCount} \nScore Total:\t#{scoreTotal} \nAverage Score:\t#{avgScore}"      