module Codebreaker
  class Game
    def initialize(out)
      @out = out
    end

    def start(secret)
      @out.puts 'Welcome to Codebreaker!'
      @out.puts 'Enter guess:'
    end

    def guess(guess)
    end
  end
end