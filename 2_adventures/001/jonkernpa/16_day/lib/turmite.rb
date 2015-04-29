class Turmite

  NORTH = 0
  EAST = 1
  SOUTH = 2
  WEST = 4

  attr_accessor :state, :square, :location, :direction, :color

  def initialize(x: 0, y: 0, square: 0, direction: NORTH, state: 0, color: 0)
    @direction = direction
    @state = state
    @color = color
    @square = square
    @location = location = [x, y]
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
    self.turn
    @location
  end

  def turn
    if state == 0 && (color == 0 || color == 1)
      # Write color == 1
      @square = 1
      # turn right
      case @direction
        when Turmite::NORTH
          new_direction = Turmite::EAST
        when Turmite::SOUTH
          new_direction = Turmite::WEST
        when Turmite::EAST
          new_direction = Turmite::SOUTH
        when Turmite::WEST
          new_direction = Turmite::NORTH
      end
      @direction = new_direction
      # Next state
      @state = 1 if color == 1
    else

    end
  end

end
