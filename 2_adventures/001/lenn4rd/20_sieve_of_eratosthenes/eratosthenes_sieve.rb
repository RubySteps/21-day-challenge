require 'set'

class EratosthenesSieve
  attr_accessor :primes
  
  def initialize(n)
    self.primes = Set.new(2..n)
    
    sieve
  end
  
  def sieve
    limit = Math.sqrt(primes.length).ceil
    
    2.upto(limit) do |i|
      j = 2
      
      while j <= primes.length do
        primes.delete(i * j)
        j += 1
      end      
    end
  end
  
  def to_s
    "Prime numbers within the limit given are:\n" << primes.inspect
  end
end

puts EratosthenesSieve.new(100)