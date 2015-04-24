require "./langtons_ant_ui"

Gtk.init

# Emulate a Grid Square in the domain
grid_square = Struct.new(:color).new.tap { |gs| gs.color = :white }

grid_square_gateway = LangtonsAntWalkWidgets::GridSquareGateway.new(grid_square)

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
    # Simulate the View asking to flip the color of the square
    grid_square_gateway.flip_color
  end
  sleep 1
  Gtk.main_quit
end

threads.map(&:join)
