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

  #             N (+y)
  #             ^
  #             |
  # (-x) W <----+----> E (+x)
  #             |
  #             v
  #             S (-y)
  def move
    dx = dy = 0
    case @direction
      when Turmite::NORTH
        dx = 0
        dy = +1
      when Turmite::SOUTH
        dx = 0
        dy = -1
      when Turmite::EAST
        dx = 1
        dy = 0
      when Turmite::WEST
        dx = -1
        dy = 0

    end
    new_x = @location.first + dx
    new_y = @location.last + dy
    @location = [new_x, new_y]
  end

end
