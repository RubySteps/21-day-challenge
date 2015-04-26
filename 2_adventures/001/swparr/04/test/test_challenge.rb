require 'minitest/autorun'
require './challenge'

describe 'Challenge' do
  before do
    @challenge = Challenge.new
  end

  it 'must initialise to ready' do
    assert @challenge.ready?
  end

end
