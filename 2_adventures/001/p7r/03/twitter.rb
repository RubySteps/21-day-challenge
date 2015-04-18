#!/usr/bin/env ruby
require 'rubygems'
require 'twitter'

if ENV['TWITTER_CONSUMER_KEY'] && ENV['TWITTER_CONSUMER_SECRET']
  puts "Twitter consumer env OK, key: " + ENV['TWITTER_CONSUMER_KEY']
else
  puts "You need to set TWITTER_CONSUMER_KEY and TWITTER_CONSUMER_SECRET in your ENV"
  exit
end

if ENV['TWITTER_ACCESS_KEY'] && ENV['TWITTER_ACCESS_SECRET']
  puts "Twitter access env OK, key: " + ENV['TWITTER_ACCESS_KEY']
else
  puts "You need to set TWITTER_ACCESS_KEY and TWITTER_ACCESS_SECRET in your ENV"
  exit
end

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
  config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
  config.access_token        = ENV['TWITTER_ACCESS_KEY']
  config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
end

client.search("#ruby -rt", lang: "en").take(20).collect do |tweet|
  puts "#{tweet.user.screen_name}: #{tweet.text}"
end