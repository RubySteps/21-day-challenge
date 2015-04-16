#If "1" has no holes, and "8" has 2 holes, what's the total number of holes for any given integer?
def puzzle(num)

numsplit = num.to_s.split('')

count = 0
total = []

numsplit.each do |x|

    if x == "8" 
      count = 2
  
    elsif
      x == "0" || x == "4" || x == "6" || x == "9"
      count = 1
    else
      count = 0
    end
    #print count
    total.push(count)
  end
   
   sum = total.inject { |x,y| x+=y }
   puts "The total number of holes for '#{num}' is: #{sum}"
   
end
puzzle(486919)
  