# Day 9

I want some graphics. I have no idea how to do graphics in Ruby. I haven't done graphics since high school. This will be interesting.

## An Incremental Approach

I have no idea whether this will work, but I need a plan. It will doubtless change. I think this might work:

1. Fixed viewport at the origin, simple grid of black and white squares, no representation of the ant.
1. Represent where the ant is.
1. Represent which way the ant is facing.
1. Movable viewport keeping the ant exactly in the middle of the screen.
1. Movable viewport keeping the ant approximately in the middle of the screen, in order to reduce viewport movement.
1. Profit?

It seems reasonable. It would thrill me to finish the first version in the next few days.

So... how do we do graphics in Ruby? DuckDuckGo to the rescue...

## The Result

Wow, that sucked, but at least now I can paint some graphics. I went on a crazy detour trying to install OpenGL and GTK3 before finally managing to install GTK2. Success looked like this:

```
$ brew install gtk+
...add gem "gtk2" to Gemfile...
$ bundle install --clean
```

It seems so easy now. It took me close to two hours to get here. I managed to put together a Hello, World! app window with a quit button, thanks to a combination of these sites:

* https://tellthemuserstories.wordpress.com/2013/01/08/installing-gtk2-for-ruby-on-mac-os-x/
* http://zetcode.com/gui/rubygtk/introduction/
* https://developer.gnome.org/gtk2/stable/

You can look at the resulting code in `learn_gtk2.rb`. Enjoy.

## Epilogue

If anyone can tell me why I couldn't install the GTK3 gem on Mac OS 10.10.2, please do. I had problems with `gobject-introspection` v2.2.4.

Of course, now that I type this, I see that there is a homebrew package for `gtk+3`. There is a clue in that sentence. First, I publish this "work"; next, I give it a try. I hope I have enough coffee.



