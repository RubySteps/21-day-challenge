def give_setup
  puts <<-EOS

Given the following expression: (m^2 + n)(2m + p);
m, n and p are positive integers.  Variable p is always even.

This program shows that whether m & n are odd or even,
the result is always even if p is even.
  EOS
end

def get_nums
=begin
  nums = []
  vars = ['m', 'n', 'p']
  vars.each do |x|
    print "\nInput number for #{x}: "
    @num = gets.to_i
    nums << @num
  end
  @first_num = nums[0]
  @second_num = nums[1]
  @third_num = nums[2]
=end
  #The above is an unnecessarily complex way of executing the next 6 lines:
  #there should be a way to simplify
  print "Input number for m: "
  @first_num = gets.to_i

  print "Input number for n: "
  @second_num = gets.to_i

  print "\nInput number for p: "
  @third_num = gets.to_i
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

if __FILE__ == $PROGRAM_NAME
  give_setup
  get_nums
  even_odd?(@first_num, @second_num, @third_num)
end

