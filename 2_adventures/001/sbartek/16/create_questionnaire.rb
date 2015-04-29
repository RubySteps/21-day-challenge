require_relative 'app/models/question'
require_relative 'app/models/questionnaire'

def create_questionnaire_from_hash(arg_hash={})
  @title = arg_hash[:title]
  @questions = []
  if arg_hash[:questions]
    arg_hash[:questions].each do |question_hash| 
      @questions.push(Question.new(question_hash))
    end
  end
  Questionnaire.new title: @title, questions: @questions
end

