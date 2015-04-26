module GamesHelper

  def pgn4web_board game
    pgn4web_board_custom "game#{game.id}", game.pgn_text_for_viewer
  end
  
  def pgn4web_board_custom id, pgn_text
     content_tag :iframe, nil, src: "http://pgn4web-board.casaschi.net/board.html?pieceFont=merida&movesDisplay=figurine&autoplayMode=none&framePadding=10px&pgnText=#{pgn_text}", id: id, class: "pgn4web-board"
  end

end
