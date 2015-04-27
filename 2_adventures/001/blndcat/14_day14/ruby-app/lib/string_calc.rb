class StringCalc

  def add(input_string)
    return 0 if input_string.empty?
    if input_string.to_i.to_s == input_string.to_s
      return input_string.to_i
    end
  end
end
