class Cell
  attr_reader :row, :column, :links
  attr_accessor :north, :south, :east, :west

  def initialize(row, column)
    @links = {}
  end

  def link(cell, bidi=true)
    @links[cell] = true
    cell.link(self, false) if bidi
  end

  def unlink(cell, bidi=true)
    @links.delete(cell)
    cell.unlink(self, false) if bidi
  end

  def linked?(cell)
    @links.key? cell
  end

  def to_s
    "cell (#{@row}, #{@column})"
  end


end
