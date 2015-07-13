class HtmlFormatter
  def initialize(entry)
    @entry = entry
  end

  def format
    @entry.paragraphs.collect { |para| format_paragraph(para) }.join("")
  end

  private

  def format_paragraph(lines)
    indent = lines.first.indent
    "#{open(indent)}#{para_contents(lines)}#{close(indent)}"
  end

  def open(indent)
    html_formatting(indent, :opening)
  end

  def para_contents(lines)
    lines.collect(&:text).join("<br/>")
  end

  def close(indent)
    html_formatting(indent, :closing)
  end

  def html_formatting(indent, open_or_close)
    if indent == 0
      html_element("p", open_or_close)
    else
      html_element("blockquote", open_or_close) * indent
    end
  end

  def html_element(name, open_or_close)
    "<#{open_or_close == :closing ? "/" : ""}#{name}>"
  end
end
