require 'emerald'

module Emerald
  class Application
    def initialize
      puts '>in Application init'
    end
 
  	def process (line)
      puts 'in process'
      puts '>>'+line
      line = "110"
  	  puts line
    end
  end
end	