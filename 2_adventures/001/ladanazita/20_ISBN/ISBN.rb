def isbn(input)
  if (input).match(/^(?:\d[\ |-]?){9}[\d|X]$/i)
    isbn_values = isbn.upcase.gsub(/\ |-/, '').split('')
    isbn_check = isbn_values.pop
    isbn_check = (isbn_check.upcase == 'X') ? 10 : isbn_check.to_i

    sum = 0
    isbn_values.each_with_index do |value, index|
      sum += (index + 1) * value.to_i
    end

    (sum % 11) == isbn_check
  else
    puts "This is not a valid ISBN code"
  end
end