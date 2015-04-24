class Hamming
  def self.compute(x,y)
    c = 0
    foo = x.split('')
    bar = y.split('')
    if foo.length == bar.length
      foo.each_index do |i|
        if foo[i] != bar[i]
         c += 1
        end
      end
    end
  end
end
