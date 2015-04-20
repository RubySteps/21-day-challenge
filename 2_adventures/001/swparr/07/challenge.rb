require 'aasm'

class Challenge

  include AASM

  aasm do

    state :ready, :initial => true
    state :started
    state :out
    state :finished

    event :start do
      transitions :from => :ready, :to => :started
    end

  end

end
