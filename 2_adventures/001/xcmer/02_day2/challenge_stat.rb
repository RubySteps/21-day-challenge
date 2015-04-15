# Get the path to the challenge dir (e.g. .../21-day-challenge/2_adventures/001)
ADVENTURE_PATH = ARGV[0]

# Stats
total_members = 0 # Total members participating
day_stats = [] # Array index as 0 => day 1, 1 => day 2, ...

# Get total members
Dir.entries(ADVENTURE_PATH).select {|entry|
  if !(entry == '.' || entry == '..')
    total_members += 1
  end
}

puts "Total members participating: #{total_members}"
