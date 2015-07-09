class Entry
  attr_accessor :lines

  def initialize(lines)
    @lines = lines
  end

  def paragraphs
    case @lines.count
    when 0
      []
    when 1
      [@lines]
    else
      reckon_paragraphs
    end
  end

  def reckon_paragraphs
    [[@lines.first]].tap do |paras|
      @lines[1..-1].each do |line|
        if line.text == ""
          paras << []
        else
          paras.last << line
        end
      end
    end
  end
end
