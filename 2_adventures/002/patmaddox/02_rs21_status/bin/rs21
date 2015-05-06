require 'thor'

class RubyStepsChallenge < Thor
  option :username, required: true
  option :adventure, required: true

  desc "status", "Check your status in the challenge."

  def status
    puts "Hello #{options[:username]}! How are you doing on Adventure #{options[:adventure]}?"
  end
end

RubyStepsChallenge.start ARGV
