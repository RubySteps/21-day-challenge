class Fixnum
  NUMERALS = {
    1000 => 'M',
     900 => 'CM',
     500 => 'D',
     400 => 'CD',
     100 => 'C',
      90 => 'XC',
      50 => 'L',
      40 => 'XL',
      10 => 'X',
       9 => 'IX',
       5 => 'V',
       4 => 'IV',
       1 => 'I'
  }
  
  def to_roman
    NUMERALS.fetch(self) { self.to_roman_by_digit }
  end
  
  protected
  
  def to_roman_by_digit
    numerals  = NUMERALS.select { |key,_| key <= self }
    remainder = self - numerals.first[0]
    
    '' << numerals.first[1] << remainder.to_roman
  end
end
