def calculateFV(monthly_investment, monthly_int_rate, months)
    future_value = 0
    (1..months.to_i).each do 
      future_value = (future_value + monthly_investment) * (1 + monthly_int_rate)
    end
    return future_value
  end

puts "\nWelcome to the Future Value Calculator\n"

choice = "y"

while choice == "y" do
  print "\nEnter monthly investment:  "
  monthly_investment = gets.chomp.to_i
  print "Enter yearly interest rate: "
  interest_rate = gets.chomp.to_f
  print "Enter number of years: "
  years = gets.chomp.to_i
  
  monthly_int_rate = interest_rate.to_f/12/100
  months = years.to_f * 12
  future_value = calculateFV(monthly_investment, monthly_int_rate, months)
  
  #currency = 
  puts "Future Value of investment:  $#{future_value.round(2)}"
  
  print "\nContinue? (y/n): "
  choice = gets.chomp
  end
  
  
      