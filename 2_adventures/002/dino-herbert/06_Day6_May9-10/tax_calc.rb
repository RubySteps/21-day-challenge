
taxrate = 0.0675 
print "Enter price (excluding tax): "
price = gets
subtotal = price.to_f
if (subtotal < 0.0) then
	subtotal = 0.0 
end
tax = subtotal * taxrate
total = subtotal + tax
puts "Tax on $#{subtotal} is $#{tax}.  The total amount due is $#{total.round(2)}"