class StringCalculator

  DEFAULT_DELIMITER = ","

  def add(numbers)
    return 0 if numbers.empty?
    reg_delimiter=/\/{2}\[(.*)\]\n(.*)/
    delimiter_group = reg_delimiter.match(numbers)
    delimiter = DEFAULT_DELIMITER
    delimiter = delimiter_group.captures.first unless has_to_change_delimiter? delimiter_group 
    numbers = delimiter_group.captures.last unless has_to_change_delimiter? delimiter_group 
    numbers.split(delimiter).reduce(0) do |total, current| 
      if not has_to_skip? current
        total = total + current.to_i
      else
        total+=0
      end
    end
  end

  private
  def has_to_skip?(number)
    number.to_i > 1000
  end

  def has_to_change_delimiter?(group)
    group.nil?
  end
end
