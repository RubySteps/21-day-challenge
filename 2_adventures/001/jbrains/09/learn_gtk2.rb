require "gtk2"

class HelloWorld < Gtk::Window
  def initialize
    super

    set_title("Hello, World!")

    signal_connect("destroy") do
      Gtk.main_quit
    end

    show_all
  end
end

Gtk.init

HelloWorld.new

Gtk.main
