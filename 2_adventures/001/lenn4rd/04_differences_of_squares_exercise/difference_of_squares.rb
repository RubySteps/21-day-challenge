class Squares
  def initialize(upper_bound)
    @upper_bound    = upper_bound
    @square_of_sums = square_of_sums
    @sum_of_squares = sum_of_squares
  end
  
  def square_of_sums
    (1..@upper_bound).inject(:+)**2
  end
  
  def sum_of_squares
    (1..@upper_bound).inject { |sum, i| sum + i**2 }
  end
  
  def difference
    @square_of_sums - @sum_of_squares
  end
end
