require "./langtons_ant_ui"

Gtk.init

require "observer"

# observable Gateway
# View connects to this in order to stay current with model changes.
# Must respond to:
#   color()
#   flip_color()
class GridSquareGateway < Struct.new(:grid_square)
  include Observable

  def color
    grid_square.color
  end

  def flip_color
    # REFACTOR Move this into the domain as flip_color, returning the new color?
    self.grid_square.color = (self.grid_square.color == :white ? :black : :white)
    self.changed
    self.notify_observers(self.grid_square.color)
  end
end

grid_square_gateway = GridSquareGateway.new(Struct.new(:color).new.tap { |gs| gs.color = :white })

# Create a window for displaying the only Grid Square widget
# so that I can inspect the results by looking at them.
main_window = Gtk::Window.new
main_window.set_title("Flip the color of a grid square")
main_window.set_default_size(100, 100)
main_window.signal_connect("destroy") {
  Gtk.main_quit
}
grid_square_widget = LangtonsAntWalkWidgets::GridSquare.with_model(grid_square_gateway)
main_window.add(grid_square_widget)
main_window.show_all()

threads = []

threads << Thread.new do
  Gtk.main
end

threads << Thread.new do
  10.times do
    sleep 1
    grid_square_gateway.flip_color
  end
  sleep 1
  Gtk.main_quit
end

threads.map(&:join)
