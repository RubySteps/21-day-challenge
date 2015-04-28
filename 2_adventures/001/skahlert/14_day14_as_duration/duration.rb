# noticed glitch in gem here. created custom gem to remove this require
# require 'time'
require 'as-duration'

times = [
  1.hour.ago,
  2.days.from_now,
  5.years.ago
]

times.each do |time|
  puts time.strftime("%Y-%m-%d %H:%M:%S")
end
