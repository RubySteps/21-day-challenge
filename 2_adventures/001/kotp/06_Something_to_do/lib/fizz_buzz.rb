module FizzBuzz
  def rules
    [
      ->(n) { (n % 3).zero? and 'Fizz' or '' },
      ->(n) { (n % 5).zero? and 'Buzz' or '' }
    ]
  end

  # We remove the self, who am I to say others want this at that level?
  def play(number)
    result = ''
    rules.each { |l| result << l[number] }
    result.empty? ? number : result
  end
end
