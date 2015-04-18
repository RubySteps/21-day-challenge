#Well I need a bit of rails (for convenience) here!
require 'active_support'
require 'active_support/time_with_zone'
require 'active_support/core_ext/time/zones'

#enter your local time zone here!
Time.zone = "Berlin"
start = ActiveSupport::TimeZone.new("Mountain Time (US & Canada)").parse("13/04/2015 12:00")
now = Time.zone.now
elapsed = (now-start)
current_day = (elapsed/3600/24).ceil
left_today = (current_day*3600*24)-elapsed
left_string = Time.at(left_today).strftime("%H:%M:%S")
puts "Today is day #{current_day}. You have #{left_string} left to send your pull requests."
