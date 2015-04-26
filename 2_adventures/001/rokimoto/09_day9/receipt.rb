def format_money money
  sprintf('$%0.2f',money).gsub(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1,")
end

purchases = {
  Popcorn: 2.2,
  Socks: 10,
  Juice: 4
}

subtotal = 0

purchases.each do |key,value| 
  subtotal += value
end

tax = subtotal * 0.075
total = tax + subtotal

line_width = 40

puts "AWESOME STORE".center(line_width)
puts "123 MAIN ST.".center(line_width)
puts "LOS ANGELES\n".center(line_width)
puts "NO. 29".ljust(line_width/4) +  Time.now.strftime("%e %b %Y %H:%M:%S%p").rjust(line_width/4*3)

puts "\n\n"

purchases.each do |key, value|
  puts ("Awesome #{key}").ljust(line_width/2) + "#{format_money value}".rjust(line_width/2)
end

puts ("-" * 10).rjust(line_width)
puts "Subtotal".rjust(line_width/2) + format_money(subtotal).rjust(line_width/2)
puts "Tax".rjust(line_width/2) + format_money(tax).rjust(line_width/2)
puts ("=" * 10).rjust(line_width)
puts "Total".rjust(line_width/2) + format_money(total).rjust(line_width/2)

puts "\n\n"

puts ("*" * 30).center(line_width)
puts ("Thank You!").center(line_width)
puts ("*" * 30).center(line_width)