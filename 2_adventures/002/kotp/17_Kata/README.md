# Today's Kata

Today just had time to do a daily Kata.  FizzBuzz for today

    class FizzBuzz
      attr_reader :number
      def  self.[](i)
        obj = FizzBuzz.new(i)
        result = [:fizz?, :buzz?].map { |m| obj.send(m) }.join('')
        result.empty? && i || result
      end
    
      def initialize(number)
        @number = number
      end
    
      private
    
      def fizz?
        'Fizz' if (@number % 3).zero?
      end
      def buzz?
        'Buzz' if (@number % 5).zero?
      end
    end
    
    -15.upto(15).each do |number|
      puts FizzBuzz[number]
    end

That is all.
