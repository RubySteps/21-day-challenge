DIVISIBLE_BY_3 = "fizz"
DIVISIBLE_BY_5 = "buzz"

def fizzbuzz(number)
  result = ""
  if(number % 3 == 0)
    result = DIVISIBLE_BY_3 
  elsif(number % 5 == 0)
    result << DIVISIBLE_BY_5 
  elsif
    result = number
  end
  result
end

(1..16).each {|n| puts fizzbuzz(n) }
