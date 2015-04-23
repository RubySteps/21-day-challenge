module Codebreaker
  class Game
    def initialize(out)
      @out = out
    end

    def start
      @out.puts 'Welcome to Codebreaker!'
      @out.puts 'Enter guess:'
    end
  end
end