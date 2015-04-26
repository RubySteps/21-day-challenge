require 'aasm'

class Challenge

  include AASM

  @date

  aasm do

    state :ready, :initial => true
    state :started
    state :active
    state :out
    state :finished

    event :start do
      transitions :from => :ready, :to => :started
    end

    event :commit do
      transitions :from => :started, :to => :active
    end

  end

  def last_commit
    @date = Time.now.strftime("%d/%m/%Y")
  end

end
