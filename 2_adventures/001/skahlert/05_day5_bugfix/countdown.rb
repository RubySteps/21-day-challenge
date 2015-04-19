#Well I need a bit of rails (for convenience) here!
require 'active_support'
require 'active_support/time_with_zone'
require 'active_support/core_ext/time/zones'

#enter your local time zone here!
Time.zone = "Berlin"
start = ActiveSupport::TimeZone.new("Mountain Time (US & Canada)").parse("13/04/2015 12:00").to_datetime
now = Time.zone.now.to_datetime
elapsed = (now-start)
current_day = (elapsed).ceil
next_deadline = start+current_day
left_today = next_deadline.to_time-now.to_time
left_string = Time.zone.at(left_today).utc.strftime("%H:%M:%S")
puts "Today is day #{current_day}. You have #{left_string} left to send your pull requests."
