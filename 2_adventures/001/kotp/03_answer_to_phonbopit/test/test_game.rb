require 'minitest/autorun'
require './lib/game'

describe 'Greeting' do
  before do
    @game = Game.new
  end

  it 'must greet the world' do
    actual = @game.greeting
    assert_equal 'Hello World', actual
  end

  it 'must greet personally' do
    actual = @game.greeting 'John'
    assert_equal 'Hello John', actual
  end

end
