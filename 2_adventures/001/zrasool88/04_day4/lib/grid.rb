class Grid

  attr_reader :size, :contents

  def initialize(size)
    @size=size
    @contents=[]
  end

  def place(content)
    @contents << content
  end
end
