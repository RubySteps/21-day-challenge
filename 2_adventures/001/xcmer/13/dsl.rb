class HTML
  def initialize(indent=0)
    @indent = indent
  end

  def html(&block)
    _p "<html>"
    _e &block
    _p "</html>"
  end

  def head(&block)
    _p "<head>"
    _e &block
    _p "</head>"
  end

  def body(&block)
    _p "<body>"
    _e &block
    _p "</body>"
  end

  def title(title)
    _p "<title>#{title}</title>"
  end

  def _e(&block)
    HTML.e(@indent + 1, &block)
  end

  def _p(text)
    print "  " * @indent
    puts text
  end

  def self.e(indent=0, &block)
    unless block.nil?
      HTML.new(indent).instance_exec &block
    end
  end
end

HTML.e do
  html do
    head do
      title "Hello World"
    end
    body do
    end
  end
end
