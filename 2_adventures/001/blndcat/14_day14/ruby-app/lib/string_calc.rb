class StringCalc

  def add(input_string)
    return 0 if input_string.empty?
    if input_string.to_i.to_s == input_string.to_s
      return input_string.to_i
    end
    if input_string.include? ','
      number1, number2 = input_string.split(',')
      result = number1.to_i + number2.to_i
      return result
    end
  end
end
