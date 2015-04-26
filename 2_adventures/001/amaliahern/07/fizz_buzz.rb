DIVISIBLE_BY_3 = "fizz"
DIVISIBLE_BY_5 = "buzz"

def is_divisible_by_3?(number)
  number % 3 == 0
end  
def is_divisible_by_5?(number)
  number % 5 == 0
end

def fizzbuzz(number)
  result = ""
  result <<  DIVISIBLE_BY_3 if is_divisible_by_3?(number)
  result <<  DIVISIBLE_BY_5 if is_divisible_by_5?(number)
  result = number if result.empty?
  result
end

