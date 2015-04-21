require 'httparty'
require_relative 'stack_overflow_api_wrapper'

response = StackOverflowApiWrapper.questions "tags" => "ruby", "fromdate" => 1429617600
json = JSON.parse response.body
questions = json["items"]
unanswered_questions = questions.select{|q|
  q["is_answered"]==false
}

unanswered_questions.each{|q|
  comments_response = HTTParty.get("https://api.stackexchange.com/2.2/questions/#{q['question_id']}/comments?site=stackoverflow&filter=total")
  q["comments_count"]= comments_response["total"]
}
unanswered_questions_without_comment = unanswered_questions.select{|q|
  q["comments_count"] == 0
}

unanswered_questions_with_comment = unanswered_questions.select{|q|
  q["comments_count"] > 0
}


puts "There are #{unanswered_questions_without_comment.size} questions without any answer or comment:"
unanswered_questions_without_comment.each{|q|
  puts q["title"]
  puts q["link"]
}

puts "There are #{unanswered_questions_with_comment.size} questions without answer but with comment:"
unanswered_questions_with_comment.each{|q|
  puts q["title"]
  puts q["link"]
}

