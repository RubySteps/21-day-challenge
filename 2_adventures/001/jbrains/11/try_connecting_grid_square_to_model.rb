require "./langtons_ant_ui"

Gtk.init

main_window = Gtk::Window.new
main_window.set_title("Flip the color of a grid square")
main_window.signal_connect("destroy") {
  Gtk.main_quit
}
main_window.show_all

Gtk.main
