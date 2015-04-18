require "05/fibonacci.rb"
require "test/unit"

class Test05 < Test::Unit::TestCase

	def test_fibonacci()
		fib = Fibonacci.new()
		assert_equal(fib.get(0), 0)
		assert_equal(fib.get(1), 1)
		assert_equal(fib.get(2), 1)
		assert_equal(fib.get(3), 2)
		assert_equal(fib.get(4), 3)
		assert_equal(fib.get(5), 5)
		assert_equal(fib.get(6), 8)
	end

	def test_fibonacci_optimized()
		fib_opt = Fibonacci.new()
		assert_equal(fib_opt.get_optimized(0), 0)
		assert_equal(fib_opt.get_optimized(1), 1)
		assert_equal(fib_opt.get_optimized(2), 1)
		assert_equal(fib_opt.get_optimized(3), 2)
		assert_equal(fib_opt.get_optimized(4), 3)
		assert_equal(fib_opt.get_optimized(5), 5)
		assert_equal(fib_opt.get_optimized(6), 8)
	end
end