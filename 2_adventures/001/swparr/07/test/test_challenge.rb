require 'minitest/autorun'
require './challenge'

describe 'Challenge' do
  before do
    @challenge = Challenge.new
  end

  it 'must initialise to ready' do
    assert @challenge.ready?
  end

  it 'must be have a status of started when called with start' do
    assert_equal @challenge.start, true
  end

end
