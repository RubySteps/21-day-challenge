require "./langtons_ant_ui"

Gtk.init

# observable Gateway
# View connects to this in order to stay current with model changes.
# Must respond to:
#   color()
#   flip_color()
#   signal_flipped_color()
class GridSquareGateway < Struct.new(:grid_square)
  def initialize(*args)
    super(*args)
    @listeners = []
  end

  def color
    grid_square.color
  end

  def add_listener(listener)
    @listeners << listener
  end

  def flip_color
    self.grid_square.color = (self.color == :white ? :black : :white)
    self.signal_flipped_color(self.color)
  end

  def signal_flipped_color(color)
    @listeners.map { |each| each.on_flip(color) }
  end
end

grid_square = GridSquareGateway.new(Struct.new(:color).new.tap { |gs| gs.color = :white })

# Create a window for displaying the only Grid Square widget
# so that I can inspect the results by looking at them.
main_window = Gtk::Window.new
main_window.set_title("Flip the color of a grid square")
main_window.set_default_size(100, 100)
main_window.signal_connect("destroy") {
  Gtk.main_quit
}
grid_square_widget = LangtonsAntWalkWidgets::GridSquare.with_model(grid_square)
main_window.add(grid_square_widget)
main_window.show_all()

threads = []

threads << Thread.new do
  Gtk.main
end

threads << Thread.new do
  10.times do
    sleep 1
    grid_square.flip_color
  end
  sleep 1
  Gtk.main_quit
end

threads.map(&:join)
