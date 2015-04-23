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
end

@save = Jar.new
@spend = Jar.new
@spare = Jar.new

def allowance(amt)
  @save.deposit(amt.to_f * 0.6)
    puts "-Save account"
  @spend.deposit(amt.to_f * 0.3)
    puts "-Spend account"
  @spare.deposit(amt.to_f * 0.1)
    puts "-Spare account"
  end
allowance(100)
allowance(200)