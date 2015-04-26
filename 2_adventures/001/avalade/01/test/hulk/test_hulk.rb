require 'minitest/autorun'
require 'hulk'

describe Hulk do
  beforeEach do
    Hulk.results = {}
  end
  it 'must exist' do
    refute_nil Hulk.new
  end

  it 'must reply with the results for the day if asked' do
    assert_equal Hulk.message('/results', ''), 'The Hulk winner this week is: no one'
  end

  it 'should allow me to vote for someone' do
    assert_equal Hulk.message('/vote' , '@adv'), {"@adv" => 1}
  end

  it 'should allow me to change my vote' do
    Hulk.message('/vote', '@adv')
    assert_equal Hulk.message('/vote', '@jon'), {'@jon' => 1}
  end

  it 'should report the results after a vote' do
    Hulk.message('/vote', '@adv')
    assert_equal Hulk.message('/results', ''), 'The Hulk standings are:\n\t@adv: 1'
  end
end
