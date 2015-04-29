require_relative 'helper'
require './create_questionnaire'
require './create_user_questionnaire'

describe 'create_user_questionnaire_from_hash' do
  before do
    @sentence1 = "Whats your name?"
    @sentence2 = "Whats your pet's name?"
    @questions = [{sentence: @sentence1}, {sentence: @sentence2}]
    @questionnaire = create_questionnaire_from_hash(
        {questions: @questions})
    @user = "Tom"
    @questions_answers = [{question_sentence: @sentence1, answer: "Tomy"}, 
                          {question_sentence: @sentence2, answer: "Yorky"}]
    @user_questionnaire = create_user_questionnaire_from_hash(
        {user: @user,
         questionnaire: @questionnaire, 
         questions_answers: @questions_answers})
  end

  it 'must create UserQuestionnaire'  do
    @user_questionnaire.must_be_instance_of(UserQuestionnaire)
  end

  it 'must have a user assigned' do
    @user_questionnaire.user.must_equal(@user)
  end

  it 'must have answers to questions' do
    @questionnaire.questions.each do |question| 
      @user_questionnaire.for_question(question).answer.wont_be_nil
    end
  end
end
