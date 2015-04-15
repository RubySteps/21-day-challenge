# Read about Langton's Ant at http://link.jbrains.ca/1FGWigr
#
# I first saw Kent Beck demonstrate this at XP Universe 2001.
# To my knowledge, I've never tried writing it myself.

Location = Struct.new(:x, :y)
class Location
  def step_towards(direction)
    # assume west
    # Note that west is unit vector (-1, 0)
    Location.new(self.x - 1, self.y + 0)
  end
end

# black_squares: List of black-colored squares
Grid = Struct.new(:black_squares) 
class Grid
  def self.with_black_squares(black_squares)
    self.new(black_squares)
  end

  def describe
    black_squares.inspect
  end
end

Direction = Struct.new(:directionAsSymbol)
class Direction
  def self.north
    self.new(:north)
  end
  
  def self.west
    self.new(:west)
  end

  def turn_left
    # assume facing north
    self.class.west
  end
end

LangtonsAnt = Struct.new(:grid, :facing, :location)
class LangtonsAnt
  def self.start(args)
    self.new(args[:grid], args[:facing], args[:location])
  end

  def go
    # assume a white square
    now_facing = self.facing.turn_left
    now_at = self.location.step_towards(now_facing)
    self.class.new(self.grid, now_facing, now_at)
  end
end

origin = Location.new(0, 0)
grid = Grid.with_black_squares([])
ant = LangtonsAnt.start(grid: grid, facing: Direction.north, location: origin)
ant = ant.go

puts "Langton's ant is now at #{ant.location}"
puts "He is facing #{ant.facing}"
puts "He sees black squares at #{ant.grid.describe()}"
