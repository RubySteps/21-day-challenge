class StringCalculator

  def add(numbers)
    return 0 if numbers.empty?
    numbers.split(",").reduce(&:+)
  end
end
