require 'aasm'

class Challenge

  include AASM

  aasm do

    state :ready, :initial => true
    state :started
    state :out
    state :finished

  end

  def initialize

  end

end
