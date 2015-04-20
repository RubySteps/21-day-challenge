require 'minitest/autorun'
require '../game'

class GameTest < MiniTest::Test

	def setup
		@game = Game.new
	end

	def test_say_hello
		message = @game.say_hello
		assert_equal "Hello World", message
	end

	def test_greeting
		greeting = @game.greeting "John"
		assert_equal "Hello John", greeting
	end

end