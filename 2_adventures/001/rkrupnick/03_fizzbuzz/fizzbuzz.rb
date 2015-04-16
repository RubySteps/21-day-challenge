i = 0
while i < 100
	if i % 3 === 0
		puts "FizzBuzz" if i % 5 === 0
		puts "Fizz"
	elsif i % 5 === 0
		puts "Buzz"
	end
	i += 1
end