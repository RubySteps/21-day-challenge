class Position
  attr_accessor :board, :turn
  DIM = 3
  SIZE = DIM * DIM
  def initialize(board=nil, turn="x")
    @board = board || %w(-)*SIZE
    @turn = turn
  end

  def move(idx)
    position = Position.new(@board.dup, xturn("o", "x"))
    position.board[idx] = turn
    position
  end

  def xturn(x,o)
    turn == "x" ? x : o
  end
end