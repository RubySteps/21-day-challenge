problems = {
  "2 + 2" => 4,
  "3 * 3" => 9,
  "6 / 2" => 3,
  "10 - 5" => 5,
  "4 * 5" => 20,
  "6 - 5" => 1,
  "7 + 5" => 12
}


problems.each do |key, value|
  while true
    print "#{key} = " 
    x = gets.chomp.to_i
    if x == value
      break
    end
  end
end

puts "You are smart"