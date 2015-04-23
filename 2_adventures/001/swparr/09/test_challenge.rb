require 'minitest/autorun'
require './challenge'

describe 'Challenge' do
  before do
    @challenge = Challenge.new
  end

  def start_and_commit
    @challenge.commit
  end

  it 'must initialise to ready' do
    assert @challenge.ready?
  end

  it 'must be have a status of active when first commit is made' do
    assert_equal @challenge.commit, true
  end

  it 'must be active when a commit is made' do
    start_and_commit
    assert @challenge.active?
  end

  it 'must have a last commit date' do
    start_and_commit
    assert_equal @challenge.last_commit, Time.now.strftime("%d/%m/%Y")
  end

  it 'must have a commit count' do
    assert_equal 0, @challenge.commits
    start_and_commit
    assert_equal 1, @challenge.commits
    @challenge.commit
    assert_equal 2, @challenge.commits
  end
end
