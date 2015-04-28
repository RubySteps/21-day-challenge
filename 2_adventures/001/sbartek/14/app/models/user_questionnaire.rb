require_relative 'question_answer'

class UserQuestionnaire

  attr_accessor :questionnaire
  attr_accessor :user

  def initialize(args_hash={})
    @questionnaire = args_hash[:questionnaire]
    @user = args_hash[:user]
  end

  def questions
    self.questionnaire.questions 
  end

  def answers
    QuestionAnswer.all.find_all do |question_answer| 
      self == question_answer.user_questionnaire
    end
  end

  def for_question(question)
    @question_answer = self.answers.find do |question_answer| 
      question_answer.question == question
    end 
    if not @question_answer 
      @question_answer = QuestionAnswer.new(
          user_questionnaire: self, question: question)
    end
    return @question_answer
  end

end
