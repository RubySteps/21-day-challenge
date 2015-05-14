def check_the_thing(path)
  # fill this out tomorrow
end

def check_warmup
  puts "checking warmups..."

  path = File.expand_path("~/code/21-day-challenge/1_warmup/patmaddox")
  files = Dir[path + "/**/*"].select {|f| f.include? 'README' }
  directories = files.collect {|f| File.dirname(f) }
  numbered_dirs = directories.collect {|d| d.split("/").last }
  numbers = numbered_dirs.collect {|d| d.to_i }
  numbers
end

def check_days_work
  puts "checking days..."

  path = File.expand_path("~/code/21-day-challenge/2_adventures/001/patmaddox")

  files = Dir[path + "/**/*"].select {|f| f.include? 'README' }

  directories = files.collect {|f| File.dirname(f) }
  numbered_dirs = directories.collect {|d| d.split("/").last }
  numbers = numbered_dirs.collect {|d| d.to_i }
  numbers
end

describe "my methods" do
  it "checks a warmup" do
    numbers = check_warmup # "~/code/21-day-challenge/1_warmup/patmaddox"
    expect(numbers).to eq([1,2])
  end

  it "checks days" do
    numbers = check_days_work
    expect(numbers).to eq([*1..21])
  end
end
