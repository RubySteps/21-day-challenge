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

require "observer"

# black_squares: List of black-colored squares
Grid = Struct.new(:black_squares) 
class Grid
  include Observable

  def self.with_black_squares(black_squares)
    self.new(black_squares)
  end

  def describe
    "[#{black_squares.collect(&:to_s).join(", ")}]"
  end

  def flip_square_at(location)
    changed
    if color_of(location) == :white
      black_squares << location
      notify_observers(location, :black)
    else
      black_squares.delete(location)
      notify_observers(location, :white)
    end
  end

  # Answers a symbol representing the color
  def color_of(location)
    black_squares.include?(location) ? :black : :white
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
  
  def self.turn_left_from(direction)
    # SMELL Circular view on an array, rather than making the array itself circular.
    index_of_next_direction_turning_left = (@@directions_rotating_left.index(direction) + 1) % @@directions_rotating_left.length
    @@directions_rotating_left[index_of_next_direction_turning_left]
  end

  def self.turn_right_from(direction)
    # SMELL Circular view on an array, rather than making the array itself circular.
    index_of_next_direction_turning_left = (@@directions_rotating_left.index(direction) - 1) % @@directions_rotating_left.length
    @@directions_rotating_left[index_of_next_direction_turning_left]
  end

  @@named_directions = {
    Direction.new(0, 1) => "north",
    Direction.new(-1, 0) => "west",
    Direction.new(0, -1) => "south",
    Direction.new(1, 0) => "east"
  }
  def to_s
    @@named_directions[self]
  end
end

LangtonsAnt = Struct.new(:grid, :facing, :location)
class LangtonsAnt
  def self.start(args)
    self.new(args[:grid], args[:facing], args[:location])
  end

  def go
    if self.grid.color_of(self.location) == :white
      self.grid.flip_square_at(self.location)
      now_facing = Direction.turn_right_from(self.facing)
      now_at = self.location.step_towards(now_facing)
      self.class.new(self.grid, now_facing, now_at)
    else
      self.grid.flip_square_at(self.location)
      now_facing = Direction.turn_left_from(self.facing)
      now_at = self.location.step_towards(now_facing)
      self.class.new(self.grid, now_facing, now_at)
    end
  end
end

class WalkListener
  def step_taken(number, ant)
    # Optional subclass responsibility
  end

  def color_flipped(location, color)
    # Optional subclass responsibility
  end
end

class ConsoleReportingWalkListener < WalkListener
  def step_taken(number, ant)
    puts (number == 0 ? "At the beginning of his walk..." : "After step #{number}")
    describe_walk(ant)
  end

  def describe_walk(ant)
    puts "Langton's ant is now at #{ant.location}, which is #{ant.grid.color_of(ant.location).to_s}"
    puts "He is facing #{ant.facing}"
    puts "He sees black squares at #{ant.grid.describe()}"
  end

  def color_flipped(location, color)
    puts "The square at #{location} is changing to #{color}"
  end
end

class LangtonsAntWalk 
  include Observable

  def initialize(walk_listener)
    origin = Location.new(0, 0)
    grid = Grid.with_black_squares([])
    grid.add_observer(walk_listener, :color_flipped)
    @ant = LangtonsAnt.start(grid: grid, facing: Direction.north, location: origin)
    self.add_observer(walk_listener, :step_taken)
    @steps = 0
    changed
    notify_observers(@steps, @ant)
  end

  def take_a_step
    @ant = @ant.go
    @steps = @steps + 1
    changed
    notify_observers(@steps, @ant)
  end
end

