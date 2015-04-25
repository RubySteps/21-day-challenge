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
    # It's like a border... until I figure out how to draw a border.
    self.modify_bg(Gtk::STATE_NORMAL, Gdk::Color.parse("black"))
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

  def initialize
    @rows = @columns = 3

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

  def initialize
    super

    set_title("Langton's Ant")

    signal_connect("destroy") do
      Gtk.main_quit
    end

    self.set_default_size(600, 600)

    @grid_panel = GridPanel.new
    self.add(@grid_panel)

    self.show_all()
  end
end

end

Gtk.init

main_window = LangtonsAntWalkWidgets::MainWindow.new
main_window.show_all()

threads = []

threads << Thread.new do
  10.times do
    x = rand(3)
    y = rand(3)
    sleep 0.5
    main_window.grid_panel.squares[x][y].color_yourself(:black)
    sleep 0.5
    main_window.grid_panel.squares[x][y].color_yourself(:white)
  end
  Gtk.main_quit
end

threads << Thread.new do
  Gtk.main
end

threads.map(&:join)

