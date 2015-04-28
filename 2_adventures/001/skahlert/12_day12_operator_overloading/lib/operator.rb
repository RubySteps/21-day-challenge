class MyOperator
  attr_accessor :text
  def initialize(text)
    @text = text
  end
  def +(operand)
     "#{self.text} #{operand.text}"
  end

  def *(operand)
    if operand.is_a?(Fixnum)
      Array.new(operand,self.text).join(" ")
    else
      raise TypeError.new('Expected Fixnum operand')
    end
  end

  def coerce(other)
    if other.is_a?(Fixnum)
      return self, other
    end
  end
end
