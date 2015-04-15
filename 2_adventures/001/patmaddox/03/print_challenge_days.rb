require 'date'

start_of_challenge = Date.parse("April 13, 2015")
format = "%a %m/%d"

21.times do |i|
  start_day = start_of_challenge + i
  end_day = start_day + 1

  puts [
    "*", # markdown list ftw!
    sprintf("Day %02d starts:", i + 1),
    start_day.strftime(format),
    "1200, ends:",
    end_day.strftime(format),
    "1159"
  ].join(" ")
end
