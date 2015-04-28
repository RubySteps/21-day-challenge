require_relative 'app/models/question'
require_relative 'app/models/questionnaire'
require_relative 'app/models/user_questionnaire'

def create_user_questionnaire_from_hash(arg_hash={})
  @user_questionnaire = UserQuestionnaire.new(arg_hash)
  @questions_answers = arg_hash[:questions_answers]
  @qnn_questions = @user_questionnaire.questionnaire.questions
  @questions_answers.each do |question_answer| 
    @question = @qnn_questions.find do |question| 
      question.sentence == question_answer[:question_sentence]
    end
    if not @question
      @question = Question.new sentence: question_answer[:question_sentence]
    end
    @user_questionnaire.for_question(@question).answer=question_answer[:answer]
  end
  @user_questionnaire
end



