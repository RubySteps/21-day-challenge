require "./lib/11/minimum_scalar_product.rb"
require "test/unit"

class Test11 < Test::Unit::TestCase

	def test_solveit
		assert_equal(MinimumScalarProduct.solveit([1, 3, -5], [-2, 4, 1]), -25)
		assert_equal(MinimumScalarProduct.solveit([1, 2, 3, 4, 5], [1, 0, 1, 0, 1]), 6)
	end
end