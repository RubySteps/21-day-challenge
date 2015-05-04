$LOAD_PATH.unshift "."

require 'yaml'
require 'data_loader'
require 'messages'
require 'curses'
require 'ui'
require 'game'
require 'title_screen'


Game.new.run
