class Object
  def is_number?
    self.to_f.to_s == self.to_s || self.to_i.to_s == self.to_s
  end
end

class StringCalc

  def add(input_string)
    return 0 if input_string.empty?
    return input_string if input_string.is_number?
  end
end
