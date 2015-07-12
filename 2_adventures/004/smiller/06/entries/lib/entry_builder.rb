class EntryBuilder
  def initialize(raw_lines)
    @raw_lines = raw_lines
  end

  def build
    Entry.new(@raw_lines.collect { |l| Line.new(*line_indent_and_text(l)) })
  end

  def line_indent_and_text(raw_line)
    c = raw_line.split("> ")
    return [0, ""] if c.size == 0
    [c.length - 1, c.last]
  end
end
