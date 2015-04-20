class FuzzyMatcher
  def initialize
    @pattern = Regexp.new('')
  end

  def pattern=(p)
    @pattern = Regexp.new(p.split('').map{|x|
      Regexp.escape(x)
    }.join('.*?'))
  end

  def score(str)
    @pattern.match(str) {|m|
      return 100.0 / ((1 + m.begin(0)) * (m.end(0) - m.begin(0) + 1))
    }

    return 0
  end
end

fm = FuzzyMatcher.new
fm.pattern = 'abc'

puts fm.score('arbec')
puts fm.score('fddsg')
puts fm.score('asdfsbsdkfcsdf')
puts fm.score('abcsjd')
