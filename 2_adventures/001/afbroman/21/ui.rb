class UI
  include Curses

  def initialize
    noecho
    init_screen
  end

  def close
    close_screen
  end

  def message(x, y, string)
    setpos(y, x)
    addstr(string)
  end

  def choice_prompt(x, y, string, choices)
    message(x, y, string + " ")

    loop do
      choice = getch
      return choice if choices.include?(choice)
    end
  end
end
