require "./lib/07/funny.rb"
require "test/unit"

class Test07 < Test::Unit::TestCase

	def test_funny
		f = Funny.new()
		assert_equal(f.funny?("acxz"), true)
		assert_equal(f.funny?("bcxz"), false)
	end
end