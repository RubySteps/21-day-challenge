class Fixnum
  def prime_factor_of?(number)
    number % self == 0
  end
end

class Raindrops
  PRIME_FACTORS = [3, 5, 7]

  SOUNDS_FOR_FACTORS = {
    '3' => 'Pling',
    '5' => 'Plang',
    '7' => 'Plong'
  }
  
  def self.convert(number)
    PRIME_FACTORS.each_with_object(sound = '') do |factor|
      sound << SOUNDS_FOR_FACTORS[factor.to_s] if factor.prime_factor_of?(number)
    end
    
    return number.to_s if sound.empty?
    
    sound
  end
end