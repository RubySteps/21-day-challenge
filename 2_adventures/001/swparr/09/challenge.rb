require 'aasm'

class Challenge

  include AASM

  @date
  attr_reader :commits

  aasm do

    state :ready, :initial => true
    state :active, :before_enter => :increase_commits
    state :out
    state :finished

    event :commit do
      transitions :from => [:ready, :active], :to => :active
    end

  end

  def initialize
    @commits = 0
  end

  def last_commit
    @date = Time.now.strftime("%d/%m/%Y")
  end

  def increase_commits
    @commits = @commits + 1
  end

end
