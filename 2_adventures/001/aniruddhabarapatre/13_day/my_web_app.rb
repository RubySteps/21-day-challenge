require "sinatra"
require "erb"
require "twitter"
require_relative 'settings'

set :server, 'thin'
set :port, 5159
set :bind, '0.0.0.0'

get '/' do
  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = SETTINGS::CONSUMER_KEY
    config.consumer_secret     = SETTINGS::CONSUMER_SECRET
    config.access_token        = SETTINGS::ACCESS_TOKEN
    config.access_token_secret = SETTINGS::ACCESS_TOKEN_SECRET
  end

  @my_tweets = client.search("patmaddox").take(3).collect do |tweet|
    puts "#{tweet.user.screen_name}: #{tweet.text}"
  end

  @project_name = "RubySteps"
  @fruits = ["banana", "orange", "mango"]
  erb :index, layout: :bootstrap
end
