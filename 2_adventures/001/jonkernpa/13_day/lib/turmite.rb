class Turmite

  attr_accessor :state, :color, :location

  def initialize(x: 0, y: 0, color: 0)
    @state = 0
    @color = color
    @location = location = [x, y]
  end

  def location=(arry)
    @location = arry
  end

end
