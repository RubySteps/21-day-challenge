class Squares
    def initialize
        @num=num
    end
    def sumOfSquares
        @num.map!{|x| x ** 2}.inject(:+)
    end
    def sumOfSums
        (1..@num).select {|x| x % 2 == 0 }.inject(:+)
    end
    def differences
        squareOfSums - sumOfSums
    end
end
