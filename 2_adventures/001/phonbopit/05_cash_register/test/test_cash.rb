require 'minitest/autorun'
require '../cash'

class CashTest < MiniTest::Test

	def setup
		@cash = Cash.new
	end

	def test_available_coins
		coins = [1000, 500, 100, 50, 20, 10, 5, 2, 1].to_a
		assert_equal coins, @cash.coins
	end

	def test_437_of_1000
		change = [500, 50, 10, 2, 1].to_a
		assert_equal change, @cash.get_change(437, 1000)
	end

	def test_389_of_2000
		change = [1000, 500, 100, 10, 1]
		assert_equal change, @cash.get_change(389, 2000)
	end

	def test_31_of_1000
		change = [500, 100, 100, 100, 100, 50, 10, 5, 2, 2]
		assert_equal change, @cash.get_change(31, 1000)
	end
end