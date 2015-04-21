require "gtk2"

class HelloWorld < Gtk::Window
  def initialize
    super

    set_title("Hello, World!")

    signal_connect("destroy") do
      Gtk.main_quit
    end

    fixed = Gtk::Fixed.new
    self.add(fixed)

    quit_button = Gtk::Button.new("Quit")
    fixed.put(quit_button, 50, 50)

    self.set_default_size(800, 600)

    show_all
  end
end

Gtk.init

HelloWorld.new

Gtk.main
