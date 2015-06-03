class Adventure
  def initialize(number)

  end

  def check_warmup(number, username)
    true
  end
end

describe Adventure do
  it "checks a warmup" do
    adventure = Adventure.new 1

    result = adventure.check_warmup 1, 'patmaddox'

    expect(result).to be(true)
  end

  it "checks a days work"

  it "reports a status"
end
