class Cell
  attr_reader :links

  def initialize
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
end
