require_relative 'quick_and_dirty'

describe "my methods" do
  it "checks a warmup" do
    numbers = check_warmup
    expect(numbers).to eq([1,2])
  end

  it "checks days" do
    numbers = check_days_work
    expect(numbers).to eq([*1..21])
  end
end
