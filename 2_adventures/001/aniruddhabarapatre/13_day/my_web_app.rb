require "sinatra"
require "erb"
require "twitter"

set :server, 'thin'
set :port, 5159
set :bind, '0.0.0.0'

get '/' do
  client = Twitter::REST::Client.new do |config|
    config.consumer_key    = "qiOb78zVugwv8Byf0oicl4thU"
    config.consumer_secret = "gZMiz9gpstdJbbymvhYK4wdbNz6vtTk2sBaU8Kqfhk0UdKM0re"
    config.access_token        = "17784523-XRD2tYWv4ucxYe7yXVFmYs3fS4M0r9RO9tjadFjeS"
    config.access_token_secret = "56NlMVwVkdqV0Qy5miiqSWmtegy3E01ngECoD8kYF5yCA"
  end

  @my_tweets = client.search("patmaddox").take(3).collect do |tweet|
    puts "#{tweet.user.screen_name}: #{tweet.text}"
  end

  @project_name = "RubySteps"
  @fruits = ["banana", "orange", "mango"]
  erb :index, layout: :bootstrap
end
