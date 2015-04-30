require_relative './lib/address_book'


sandy_addr = Address.new
sandy_addr.street = "324 Campus Dr."
sandy_addr.city   = "College Park"

sandy = Person.new
sandy.first_name = "Sandy"
sandy.last_name  = "Koh"
sandy.address = sandy_addr

joe_addr = Address.new
joe_addr.street = "23 St George St."
joe_addr.city   = "Silver Spring"
joe_addr.state  = "MD"
joe_addr.zip    = "20465"

joe = Person.new
joe.first_name = "Joe"
joe.last_name  = "Smith"
joe.address = joe_addr

book = AddressBook.new

book.add sandy
book.add joe

# Print addressbook
puts "Printing the addressbook\n"
book.each { |person| puts person }

# Print addresses
puts "\nPrinting addresses\n"
book.each_address { |address| puts address }
