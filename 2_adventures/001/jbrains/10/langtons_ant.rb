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
    "[#{black_squares.collect(&:to_s).join(", ")}]"
  end

  def flip_square_at(location)
    if color_of(location) == :white
      black_squares << location
    else
      black_squares.delete(location)
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
end

class LangtonsAntWalk
  def initialize
    origin = Location.new(0, 0)
    grid = Grid.with_black_squares([])
    @ant = LangtonsAnt.start(grid: grid, facing: Direction.north, location: origin)
    @steps = 0
    @walk_listener = ConsoleReportingWalkListener.new
    @walk_listener.step_taken(0, @ant)
  end

  def take_a_step
    @ant = @ant.go
    @steps = @steps + 1
    @walk_listener.step_taken(@steps, @ant)
  end
end

require "gtk2"
class LangtonsAntWalkGridPanel < Gtk::Table
  def initialize
    # 3 rows
    # 3 columns
    # all cells the same size
    super(3, 3, true)

    self.attach_defaults(Gtk::Button.new, 0, 1, 0, 1)
  end
end

class LangtonsAntWalkMainWindow < Gtk::Window
  def initialize
    super

    set_title("Langton's Ant")

    signal_connect("destroy") do
      Gtk.main_quit
    end

    self.set_default_size(600, 600)

    grid_panel = LangtonsAntWalkGridPanel.new
    self.add(grid_panel)
  end
end

Gtk.init
main_window = LangtonsAntWalkMainWindow.new
main_window.show_all
Gtk.main
