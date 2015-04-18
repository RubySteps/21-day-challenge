class Calculator
    def initialize(one, two)
        @one = one
        @two = two
    end

    def add
        @one + @two
    end

    def subtract
        @one - @two
    end

    def times
        @one * @two
    end

    def divide
        @one / @two
    end
end

calc1 = Calculator.new(27, 4)
calc2 = Calculator.new(13, 4)

puts calc1.add
puts calc1.times
puts calc2.subtract
puts calc2.divide
