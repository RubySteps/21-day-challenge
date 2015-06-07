class Adventure
  def initialize(number)

  end

  def check_warmup(number, username)
    path = "~/code/21-day-challenge/1_warmup/#{username}/"

    potential_files = [
      "#{path}/0#{number}_my_first_warmup/README.md",
      "#{path}/0#{number}/README.md"
    ]

    return potential_files.any? {|f| File.file? File.expand_path(f) }
  end
end

describe Adventure do
  let(:adventure) { Adventure.new 1 }

  it "checks a warmup" do
    result = adventure.check_warmup 1, 'patmaddox'

    expect(result).to be(true)
  end

  it "checks another warmup" do
    result = adventure.check_warmup 2, 'patmaddox'

    expect(result).to be(true)
  end

  it "reports a missing warmup" do
    result = adventure.check_warmup 3, 'patmaddox'

    expect(result).to be(false)
  end

  it "checks a days work"

  it "reports a status"
end
