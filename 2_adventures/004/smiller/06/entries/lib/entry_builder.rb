class EntryBuilder
  def initialize(raw_lines)
    @raw_lines = raw_lines
  end

  def build
    Entry.new(build_lines)
  end

  def build_lines
    lines = [Line.new(*line_indent_and_text(@raw_lines[0]))]
    @raw_lines[1..-1].each do |raw_line|
      new_line = Line.new(*line_indent_and_text(raw_line))
      last_indent = lines.last.indent
      if new_line.indent == 0 && new_line.text != ""
        new_line.indent = last_indent
      end
      lines << new_line
    end
    lines
  end

  def line_indent_and_text(raw_line)
    c = raw_line.split("> ")
    return [0, ""] if c.size == 0
    [c.length - 1, c.last]
  end
end
