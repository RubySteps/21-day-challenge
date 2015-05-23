def explain_setup
  puts <<-EOS

Given the following expression: (m^2 + n)(2m + p);
m, n and p are positive integers.  Variable p is always even.

This program shows that whether m & n are odd or even,
the result is always even if p is even.

The numbers input must be POSITIVE INTEGERS
  EOS
end

def get_nums
  #@num = 0
  nums = []
  vars = ['m', 'n', 'p']
  
  vars.each do |x|
    print "\nInput number for #{x}: "
    @num = gets.to_i
      if @num < 0 
        puts "Integer must be positive. Try again."
        redo
      end
    nums << @num
  end
  @first_num = nums[0]
  @second_num = nums[1]
  @third_num = nums[2]
end

def even_odd?(first, second, third)
  puts "\nm = #{first}, n = #{second}, p = #{third}"
  ans =(first ** 2 + second) * (2 * first + third)
  puts "Result: #{ans}" 
  if ans %2 == 0
    puts '...an even number'
  else
    puts '...an odd number'
  end
end

def get_loop()
  print 'Go again (Y/N)?'
  @response = gets.chomp.downcase
end



if __FILE__ == $PROGRAM_NAME
  explain_setup
  loop do
    get_nums
    even_odd?(@first_num, @second_num, @third_num)
    get_loop
    break if @response == 'n'
  end
end

