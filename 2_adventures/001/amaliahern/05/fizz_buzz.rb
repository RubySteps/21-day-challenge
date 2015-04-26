DIVISIBLE_BY_3 = "fizz"
DIVISIBLE_BY_5 = "buzz"

def fizzbuzz(number)
  result = number
  if(number % 3 == 0 and number % 5 == 0)
    result = DIVISIBLE_BY_3 + DIVISIBLE_BY_5  
  elsif(number % 3 == 0)
    result = DIVISIBLE_BY_3 
  elsif(number % 5 == 0)
    result = DIVISIBLE_BY_5 
  end
  result
end

(1..100).each {|n| puts fizzbuzz(n) }
