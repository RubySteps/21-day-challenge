module StackOverflowObserver
  class StackOverflowReport

    def initialize tags, hours
      @tags = tags
      utc_fromdate = Time.now.utc - (hours*60*60)
      @fromdate_offset = utc_fromdate.utc_offset
      execute_queries
      group_questions
    end

    def output
      result = output_for_array @unanswered_questions_without_comment, "questions without any answer or comment"
      result += output_for_array @unanswered_questions_with_comment, "questions without answer but with comment"
      result
    end

    private
    def execute_queries
      response = StackOverflowApiWrapper.questions "tags" => @tags, "fromdate" => @fromdate_offset
      json = JSON.parse response.body
      questions = json["items"]
      @unanswered_questions = questions.select{|q|
        q["answer_count"] == 0
      }

      @unanswered_questions.each{|q|
        comments_response = StackOverflowApiWrapper.count_comments_for_question q['question_id']
        q["comments_count"]= comments_response["total"]
      }
    end

    def group_questions
      @unanswered_questions_without_comment = @unanswered_questions.select{|q|
        q["comments_count"] == 0
      }

      @unanswered_questions_with_comment = @unanswered_questions.select{|q|
        q["comments_count"] > 0
      }
    end

    def output_for_array array, label
      result = "\n\nThere are #{array.size} #{label}:\n\n"
      question_outputs = array.collect{|q|
        output_for_question q
      }
      result += question_outputs.join "\n"
      result += "*" * 55
      result
    end

    def output_for_question question
      question["title"]+"\n"+question["link"]+"\n"
    end
    
  end
end
