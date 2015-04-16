def add_suffix(num)
  last = num.to_s.split("").last
  second_to_last = num.to_s.split("").reverse[1]
  if last == "1"
    suffix = "st"
  elsif last == "2"
    suffix = "nd"
  elsif last == "3"
    suffix = "rd"
  else
    suffix = "th"
  end
  if second_to_last == "1"
    suffix = "th"
  end
  num.to_s + suffix
end