# Read about Langton's Ant at http://link.jbrains.ca/1FGWigr
#
# I first saw Kent Beck demonstrate this at XP Universe 2001.
# To my knowledge, I've never tried writing it myself.

Vector = Struct.new(:x, :y)
class Location < Vector
  def step_towards(direction)
    Location.new(self.x + direction.x, self.y + direction.y)
  end

  def to_s
    "(#{x}, #{y})"
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

  def flip_square_at(location)
    # assume white square
    black_squares << location
  end
end

# CONTRACT Directions are unit Vectors
class Direction < Vector
  # how to make this array circular?
  @@directions_rotating_left = [
    Direction.new(0, 1),
    Direction.new(-1, 0),
    Direction.new(0, -1),
    Direction.new(1, 0)
  ]

  def self.north
    self.new(0, 1)
  end
  
  def self.west
    self.new(-1, 0)
  end

  def turn_left
    # ugh. maintain a cursor, maybe?
    @@directions_rotating_left[@@directions_rotating_left.index(self) + 1]
  end
end

LangtonsAnt = Struct.new(:grid, :facing, :location)
class LangtonsAnt
  def self.start(args)
    self.new(args[:grid], args[:facing], args[:location])
  end

  def go
    self.grid.flip_square_at(self.location)
    # assume a white square
    now_facing = self.facing.turn_left
    now_at = self.location.step_towards(now_facing)
    self.class.new(self.grid, now_facing, now_at)
  end
end

def describe_walk(ant)
  puts "Langton's ant is now at #{ant.location}"
  puts "He is facing #{ant.facing}"
  puts "He sees black squares at #{ant.grid.describe()}"
end

def take_a_step(ant)
  ant = ant.go
  $steps = $steps + 1
  puts "After step #{$steps}"
  describe_walk(ant)
  ant
end

origin = Location.new(0, 0)
grid = Grid.with_black_squares([])
ant = LangtonsAnt.start(grid: grid, facing: Direction.north, location: origin)

puts "At the beginning of his walk..."
describe_walk(ant)

$steps = 0
2.times do
  ant = take_a_step(ant)
end

