require "gtk2"
require "observer"

module LangtonsAntWalkWidgets
 
# observable Gateway
# View connects to this in order to stay current with model changes.
# Must respond to:
#   color()
#   flip_color()
class GridSquareGateway < Struct.new(:grid_square)
  include Observable

  def color
    self.grid_square.color
  end

  def flip_color
    self.grid_square.flip_color()
    self.changed
    self.notify_observers(self.grid_square.color)
  end
end

class GridSquare < Gtk::Frame
  # REFACTOR Rename this "grid square gateway"
  attr_accessor :grid_square_model

  # grid_square_model (can't be called "model", because Gtk::Frame uses that) must support:
  # add_listener(listener)
  # color
  def self.with_model(model)
    self.new(model.color).tap { |view|
      view.grid_square_model = model
      model.add_observer(view, :on_flip)
    }
  end

  def initialize(color)
    super()
    # The area that actually changes color.
    @interior = Gtk::DrawingArea.new.tap { |area| 
      area.modify_bg(Gtk::STATE_NORMAL, Gdk::Color.parse(color.to_s)) 
    }
    self.add(@interior)
  end

  def self.white
    self.new(:white)
  end

  def color_yourself(color)
    @interior.modify_bg(Gtk::STATE_NORMAL, Gdk::Color.parse(color.to_s))
  end

  def on_flip(color)
    self.color_yourself(color)
  end
end

class GridPanel < Gtk::Table
  attr_reader :squares

  def initialize(grid_radius)
    @rows = @columns = grid_radius * 2 + 1

    # true -> all cells the same size
    super(@rows, @columns, true)

    @squares = []
    @rows.times do |x|
      @squares.push([])
      @columns.times do |y|
        square = GridSquare.white
        @squares[x][y] = square
        self.attach_defaults(square, x, x+1, y, y+1)
      end
    end
  end
end

class MainWindow < Gtk::Window
  attr_reader :grid_panel
  attr_reader :walk_description_label

  def initialize(options = Hash.new)
    super()

    set_title("Langton's Ant")

    signal_connect("destroy") do
      Gtk.main_quit
    end

    @grid_panel = GridPanel.new(options[:grid_radius] || 1)
    @grid_panel.set_size_request(600, 600)
    layout_container = Gtk::VBox.new(false, 0)
    layout_container.add(@grid_panel)

    control_panel = Gtk::HBox.new(false, 10)
    @walk_description_label = Gtk::Label.new("Langton's Ant hasn't yet taken a step.")
    control_panel.add(@walk_description_label)
    control_panel.set_size_request(0, 50)

    layout_container.add(control_panel)
    self.add(layout_container)

    self.show_all()
  end
end

end

Gtk.init

main_window = LangtonsAntWalkWidgets::MainWindow.new(grid_radius: 30)
main_window.show_all()

threads = []

require "./langtons_ant"
class WidgetsWalkListener < WalkListener
  def initialize(square_widgets, walk_description)
    @square_widgets = square_widgets
    # Assumes a square grid.
    @rows = @columns = @square_widgets.length
    # The grid is of size 2n+1, where n is the "radius".
    @grid_radius = (@rows - 1) / 2

    @walk_description = walk_description
  end

  def color_flipped(location, color)
    # Locations go from (-n, -n) to (n, n) in a grid of size 2n+1.
    # x, y coordinates on the grid go from (0, 0) to (2n, 2n)
    widget_grid_x = location.x + @grid_radius
    widget_grid_y = location.y + @grid_radius
    # Don't try to paint outside the viewport
    if ((0...@rows).include?(widget_grid_x) && (0...@columns).include?(widget_grid_y))
      @square_widgets[widget_grid_x][widget_grid_y].color_yourself(color)
    end
  end

  def step_taken(number, ant)
    @walk_description.set_text("Langton's ant is at #{ant.location} facing #{ant.facing} after step #{number}.")
  end
end

threads << Thread.new do
  walk = LangtonsAntWalk.new(WidgetsWalkListener.new(main_window.grid_panel.squares, main_window.walk_description_label))
  32_000.times do
    # sleep 0.001
    walk.take_a_step
  end
  Gtk.main_quit
end

threads << Thread.new do
  Gtk.main
end

threads.map(&:join)

