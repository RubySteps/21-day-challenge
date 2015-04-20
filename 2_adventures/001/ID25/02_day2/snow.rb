star = "*"
text = "HAPPY NEW YEAR!"

for i in 50...200
  puts star.center(rand(i))
end

puts text.center(500)
