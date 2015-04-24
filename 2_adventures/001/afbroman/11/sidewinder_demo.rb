require 'grid'
require 'sidewinder'

grid = Grid.new(7, 7)
Sidewinder.on(grid)

puts grid

img = grid.to_png
img.save "sidewinder_maze.png"
