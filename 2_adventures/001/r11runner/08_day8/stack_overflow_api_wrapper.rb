require 'httparty'

module StackOverflowApiWrapper
  def self.questions args
    HTTParty.get 'http://api.stackexchange.com/2.2/questions', query: {site: "stackoverflow", tagged: args["tags"], fromdate: args["fromdate"]}
  end
end
