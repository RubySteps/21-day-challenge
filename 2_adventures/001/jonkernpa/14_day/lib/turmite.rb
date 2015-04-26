class Turmite

  NORTH = 0
  EAST = 1
  SOUTH = 2
  WEST = 4

  attr_accessor :state, :square, :location, :direction

  def initialize(x: 0, y: 0, square: 0, direction: NORTH)
    @direction = direction
    @state = 0
    @square = square
    @location = location = [x, y]
  end

  def location=(arry)
    @location = arry
  end

end
