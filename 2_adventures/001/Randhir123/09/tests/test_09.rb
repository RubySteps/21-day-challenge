require "./lib/09/storecredit.rb"
require "test/unit"

class Test09 < Test::Unit::TestCase

	def test_solveit()
		assert_equal(StoreCredit.solveit(100, [5, 75, 25]), [2, 3])
		assert_equal(StoreCredit.solveit(200, [150, 24, 79, 50, 88, 345, 3]), [1, 4])
		assert_equal(StoreCredit.solveit(8, [2, 1, 9, 4, 4, 56, 90, 3]), [4, 5])
	end
end