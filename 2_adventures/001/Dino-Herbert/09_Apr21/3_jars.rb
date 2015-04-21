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
    @balance = @balance - wd_amt
    puts "\nBalance after withdraw is $#{@balance}."
  end
end

save = Jar.new
spend = Jar.new
spare = Jar.new

save.deposit(60)
spend.deposit(30)
spare.deposit(10)

#the 'allowance' method is supposed to do what lines 22-24 did, but the new instances aren't recognized inside the method
def allowance(amt.to_f)
  save.deposit(amt.to_f * 0.6)
    puts "Save balance = $#{@balance}."
  spend.deposit(amt.to_f * 0.3)
    puts "Spend balance = $#{@balance}."
  spare.deposit(amt.to_f * 0.1)
    puts "Spare balance = $#{@balance}."
end

allowance(100)