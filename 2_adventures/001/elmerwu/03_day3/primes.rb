# Input = 9      Output = 23
# Input = 100    Output = 541
# given a number n, find the nth prime number

def nth_prime(num)
  prime_count = 1
  n = 2

  while prime_count < num
    prime_count += 1 if prime_number?(n)
    n += 1
  end

  n - 1
end

def prime_number?(num)
  return false if num.even?

  ary = (2...num).to_a
  odd_nums_ary = ary.delete_if &:even?

  divisors = 0

  odd_nums_ary.each do |x|
    divisors += 1 if num % x == 0
    break if divisors > 0
  end

  divisors == 0 ? true : false
end

nth_prime(9) == 23
nth_prime(100) == 541