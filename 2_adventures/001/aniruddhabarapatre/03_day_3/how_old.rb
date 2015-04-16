# If I am 1204 million seconds old, how old am I?
#
# doctest: I pass in seconds to get age in years
# >> seconds_to_year 1204000000
# => 38

def seconds_to_year seconds
  seconds / (60 * 60 * 24 * 365)
end

if __FILE__ == $0
  puts "If I am 1204 million seconds old means I am #{seconds_to_year(1204000000)} year old"
end
