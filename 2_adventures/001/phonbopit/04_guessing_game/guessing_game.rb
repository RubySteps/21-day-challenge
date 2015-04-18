secret_number = rand(100) + 1

puts "Welcome to Guessing Game :)"
puts "-" * 20

won = false

5.times do
	print "Choose a number between 1 - 100  ===> "
	guess = gets.chomp.to_i

	if guess == secret_number
		won = true
		break
	end

	if guess > secret_number
		puts "Your guess is greater than the secret number."
	else
		puts "Your guess is smaller than the secret number."
	end
end

if won
	puts "You win."
else 
	puts "You Lost. The secret number was #{secret_number}"
end