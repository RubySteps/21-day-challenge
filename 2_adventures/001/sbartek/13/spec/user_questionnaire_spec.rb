require_relative 'helper'

describe UserQuestionnaire do 
  
  before do 
    @user_questionnaire = UserQuestionnaire.new
  end

  it 'must respond to @questionnaire' do
    @user_questionnaire.must_respond_to(:questionnaire)
  end

  it 'must respond to answers' do 
    @user_questionnaire.must_respond_to(:answers)
  end

  describe  'when one sets questionnaire' do
    before do
      @question1 = 'Q1'
      @question2 = 'Q2'
      @questions = [@question1, @question2]
      @questionnaire = Questionnaire.new questions: @questions
      @user_questionnaire.questionnaire = @questionnaire
    end

    it 'must respond to questions' do
      @user_questionnaire.must_respond_to(:questions)
    end

    it 'must have questions the same as questionnaire has' do
      @user_questionnaire.questions.must_equal(@questionnaire.questions)
    end 

    it 'must have empty set of answers' do
      @user_questionnaire.answers.must_equal([])
    end

    describe 'we set set answer to a question' do
      before do 
        @answer = "A1"
        @user_questionnaire.for_question(@question1)
      end
      
      it 'must have set of answers with one element' do
        @user_questionnaire.answers.first.user_questionnaire.must_equal(
             @user_questionnaire)
        @user_questionnaire.answers.first.question.must_equal(@question1)
      end

      it 'must have set answer to question' do
        @user_questionnaire.for_question(@question1).answer= @answer
        @user_questionnaire.for_question(@question1).answer.must_equal(@answer)
      end
    end
  end
end
