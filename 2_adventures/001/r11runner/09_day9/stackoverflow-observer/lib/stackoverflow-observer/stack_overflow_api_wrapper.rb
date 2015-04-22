require 'httparty'

module StackOverflowObserver::StackOverflowApiWrapper
  def self.questions args
    HTTParty.get 'http://api.stackexchange.com/2.2/questions', query: {site: "stackoverflow", tagged: args["tags"], fromdate: args["fromdate"]}
  end

  def self.count_comments_for_question question_id
    HTTParty.get("https://api.stackexchange.com/2.2/questions/#{question_id}/comments?site=stackoverflow&filter=total")
  end
end
