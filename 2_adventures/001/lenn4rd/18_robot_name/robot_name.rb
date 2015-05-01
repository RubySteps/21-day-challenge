class Robot
  def initialize
    name
  end
  
  def name
    @name ||= "#{prefix}#{suffix}"
  end
  
  def reset
    @name = nil
  end
  
  private
  
  def prefix
    ('A'..'Z').to_a.sample(2).join
  end
  
  def suffix
    (0..9).to_a.sample(3).join
  end
end