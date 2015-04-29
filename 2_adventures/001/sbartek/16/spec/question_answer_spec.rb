require_relative 'helper'

describe QuestionAnswer do

  before do 
    @question = 'Q'
    @user_questionnaire = 'UQA'
    @answer = 'A'
  end

  describe 'initialize with no args' do
    before do
      QuestionAnswer.class_variable_set :@@all, [] 
      @questions_answers = QuestionAnswer.new
    end

    it 'must respond to question' do
      @questions_answers.must_respond_to(:question)
    end

    it 'must respond to answer' do
      @questions_answers.must_respond_to(:answer)
    end

    it 'must respond to user_questionnaire' do 
      @questions_answers.must_respond_to(:user_questionnaire)
    end

    it 'must be able to set question, answer, questionnaire' do
      @questions_answers.question= @question
      @questions_answers.answer= @answer
      @questions_answers.user_questionnaire= @user_questionnaire
      @questions_answers.question.must_equal(@question)
      @questions_answers.answer.must_equal(@answer)
      @questions_answers.user_questionnaire.must_equal(@user_questionnaire)
    end

    it 'must store all initialized instances' do
      QuestionAnswer.all.must_equal([@questions_answers])
      @questions_answers2 = QuestionAnswer.new
      QuestionAnswer.all.must_equal([@questions_answers, 
                                       @questions_answers2])
    end
  end

  describe 'initialize with args' do
    before do
      @questions_answers = 
        QuestionAnswer.new({
          question: @question, answer: @answer, 
          user_questionnaire: @user_questionnaire})
    end

    it 'must have question, answer, questionnaire as was set' do
      @questions_answers.question.must_equal(@question)
      @questions_answers.answer.must_equal(@answer)
      @questions_answers.user_questionnaire.must_equal(@user_questionnaire)
    end

    it 'must respond to answer' do
      @questions_answers.must_respond_to(:answer)
    end

    it 'must respond to questionnaire' do 
      @questions_answers.must_respond_to(:user_questionnaire)
    end
  end
  
end
