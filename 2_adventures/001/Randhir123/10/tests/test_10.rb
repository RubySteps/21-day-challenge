require "./lib/10/spelling.rb"
require "test/unit"

class Test10 < Test::Unit::TestCase

	def test_message()
		spelling = Spelling.new
		assert_equal(spelling.message("hi"), "44 444")
		assert_equal(spelling.message("yes"),"999337777")
		assert_equal(spelling.message("foo  bar"), "333666 6660 022 2777")
		assert_equal(spelling.message("hello world"), "4433555 555666096667775553")
	end
end