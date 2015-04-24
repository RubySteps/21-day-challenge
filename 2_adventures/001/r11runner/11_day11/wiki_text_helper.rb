module WikiTextHelper
  def replace_custom_markup text
    # at the moment 2 custom markups are supported:
    # #game<id>#link# => a link to the game
    # #game<id>#board# => an iframe with a pgn4web-board displaying the pgn-text of the game
    
    if text.nil?
      return  nil
    end

    sanitized_text = sanitize(text)
    replaced_text =  sanitized_text.gsub(markup_regex){|markup_text| element_for markup_text}
    simple_format(replaced_text, {}, sanitize: false)
  end

  private
  def element_for markup_text
    game = retrieve_game markup_text
    markup_type = retrieve_markup_type markup_text
    element_for_markup markup_type, game
  end

  def retrieve_game markup_text
    game_id = markup_text.match(/\d+/).to_s
    Game.find game_id
  end

  def retrieve_markup_type markup_text
    type = markup_text.match /#[a-zA-Z]+#/
    type.to_s
  end

  def markup_regex
    /#game\d+#[a-zA-Z]+#/
  end

  def element_for_markup markup_type, game
    case markup_type
    when "#link#"
      link_to game.label, game
    when "#board#"
      pgn4web_board game
    else
      "unknown markup element #{markup_type} for game #{game.id}"
    end
  end

end
