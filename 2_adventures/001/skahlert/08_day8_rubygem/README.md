#21-Day-Challenge Countdown timer
Are you worrying to deliver you pull request in time? Does the time-zone difference to "Mountain Time" give you trouble?

Worry no more:
No you can check easily how much time is left on the clock and what the current day in the challenge is.

Special thanks to [Victor Goff](https://github.com/kotp) for the inspiration.

##Intallation:

gem install 21-day-challenge-countdown

##Usage

The gem is quite simple to use:

###In your code:
```ruby
require "21-day-challenge-countdown"
countdown = TwentyOneDayChallenge::Countdown.new
countdown.current_day
# => 8
countdown.time_left
# => Thu, 01 Jan 1970 04:05:44 UTC +00:00
countdown.deadline
# => "Today is day 8. You have 04:05:44 left to send your pull request."
```
###Command line
```bash
$ challenge_countdown
Today is day 8. You have 04:03:04 left to send your pull request.
```
