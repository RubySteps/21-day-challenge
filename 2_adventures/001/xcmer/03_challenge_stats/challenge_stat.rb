# Get the path to the challenge dir (e.g. .../21-day-challenge/2_adventures/001)
ADVENTURE_PATH = ARGV[0]

# Stats
total_members = 0 # Total members participating
day_stats = Array.new(21, 0) # Array index as 0 => day 1, 1 => day 2, ...
user_info = {} # Data mapped by user

# Get total members
Dir.entries(ADVENTURE_PATH).select {|entry|
  if !(entry == '.' || entry == '..' || entry == 'README.md')
    total_members += 1

    # User's path
    user_path = ADVENTURE_PATH + entry
    Dir.entries(user_path).select {|day|
      if !(entry == '.' || entry == '..')
        unless (day =~ /^\d{2}.*/).nil?
          actual_day = day[0, 2].to_i
          day_stats[actual_day-1] += 1
        end
      end
    }
  end
}

puts "Total members participating: #{total_members}"
puts "Day stats:"
(1..21).each {|day|
  puts "Day #{day}: #{day_stats[day-1]} members"
}
