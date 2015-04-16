module FizzBuzz
  def self.play(number)
    result = ''
    result << 'Fizz' if number.divisible_by?(3)
    result << 'Buzz' if number.divisible_by?(5)
    result.empty? ? number : result
  end
end

module FB_Tools
  def divisible_by?(other)
    (self % other).zero?
  end
end

class Fixnum
  include FB_Tools
end

