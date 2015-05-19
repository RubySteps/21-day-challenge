def check_the_thing(path)
  path = File.expand_path path

  files = Dir[path + "/**/*"].select {|f| f.include? 'README' }

  directories = files.collect {|f| File.dirname(f) }

  numbered_dirs = directories.collect {|d| d.split("/").last }
  numbers = numbered_dirs.collect {|d| d.to_i }
  numbers
end

def check_warmup
  check_the_thing "~/code/21-day-challenge/1_warmup/patmaddox"
end

def check_days_work
  check_the_thing "~/code/21-day-challenge/2_adventures/001/patmaddox"
end

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
