require 'date'
today = Date.today
start_of_challenge = Date.parse("April 13, 2015")
days_done = (today - start_of_challenge).to_i
format = "%a %m/%d"

days_done.times do |i|
  start_day = start_of_challenge + i
  end_day = start_day + 1

  puts [
    "*",
    sprintf("Day %02d:", i + 1),
    start_day.strftime(format),
    "=> " + (21-i).to_s + " days of Ruby on the wall.",
    (21-i).to_s + " days of Ruby!!!",
    "Take one down, pass it around",
    (21-i-1).to_s + " days of Ruby on the wall!"
  ].join(" ")
end