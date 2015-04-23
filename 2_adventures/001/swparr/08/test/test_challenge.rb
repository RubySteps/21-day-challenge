require 'minitest/autorun'
require './challenge'

describe 'Challenge' do
  before do
    @challenge = Challenge.new
  end

  def start_and_commit
    @challenge.start
    @challenge.commit
  end

  it 'must initialise to ready' do
    assert @challenge.ready?
  end

  it 'must be have a status of started when called with start' do
    assert_equal @challenge.start, true
  end

  it 'must be active when a commit is made' do
    start_and_commit
    assert @challenge.active?
  end

  it 'must have a last commit date' do
    start_and_commit
    assert_equal @challenge.last_commit, Time.now.strftime("%d/%m/%Y")

  end


end
