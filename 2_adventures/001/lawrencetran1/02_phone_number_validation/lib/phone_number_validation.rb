# input must be a string
def validate_phone_number(input)
	# removes all punctuation from input and converts to integer
	num = input.gsub(/\W/, '').to_i
	# converts back to string and check if length is 10
	if num.to_s.length == 10
		# if length is 10, phone number is valid
		puts "Yay! your phone number is legit!!!"
	else
		# if length is not 10, phone number is invalid
		puts "Whoops! you entered an invalid phone number..."
	end
end