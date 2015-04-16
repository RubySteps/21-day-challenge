def add_suffix(num)
  num_array = num.to_s.split("")
  last = num_array.last
  second_to_last = num_array.reverse[1]
  if second_to_last == "1"
    suffix = "th"
  elsif last == "1"
    suffix = "st"
  elsif last == "2"
    suffix = "nd"
  elsif last == "3"
    suffix = "rd"
  else
    suffix = "th"
  end
  num.to_s + suffix
end