require_relative 'helper'
require './create_questionnaire'


describe 'create_questionnaire_from_hash' do
  it 'must create questionnaire' do
    @questionnaire = create_questionnaire_from_hash({})
    @questionnaire.must_be_instance_of(Questionnaire)
  end
  
  it 'must have a proper title' do
    @title = 'Title'
    @questionnaire = create_questionnaire_from_hash({title: @title})
    @questionnaire.title.must_equal(@title)
  end

  it 'must create a list of questions' do
    @sentence = "Sentence?"
    @questions = [{sentence: @sentence}]
    @questionnaire = 
      create_questionnaire_from_hash({questions:@questions})
    @questionnaire.questions[0].sentence.must_equal(@sentence)
  end
end

