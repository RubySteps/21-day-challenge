def fizzbuzz(number)
  return "fizzbuzz" if(number % 3 == 0 and number % 5 == 0)
  return "fizz" if number % 3 == 0
  return "buzz" if number % 5 == 0
  number
end
