def add_suffix(num)
  num_array = num.to_s.split("")
  last, second_to_last = num_array.last, num_array[-2]
  if second_to_last == "1"
    suffix = "th"
  else
    case last
      when "1"
        suffix = "st"
      when "2"
        suffix = "nd"
      when "3"
        suffix = "rd"
      else
        suffix = "th"
    end
  end
  num.to_s + suffix
end