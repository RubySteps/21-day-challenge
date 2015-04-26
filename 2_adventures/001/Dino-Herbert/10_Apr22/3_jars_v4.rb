class Jar
  def initialize(balance = 0)
    @balance = balance
    puts "\nBeginning balance is $#{@balance}."
  end
  
  def deposit(dep_amt)
    @balance += dep_amt
    puts "\nBalance after deposit is $#{@balance}."
  end
  
  def withdraw(wd_amt)
    @balance -= wd_amt
    puts "\nBalance after withdraw is $#{@balance}."
  end
  
  def balance
  puts "\nBalance = $#{@balance}"
  end
end

save = Jar.new(100)
spend = Jar.new
spare = Jar.new

accts = [save, spend, spare]
amt = [60, 30, 10]

h = Hash[accts.zip amt] 
puts h

puts save.balance