require_relative 'helper'

describe Questionnaire do
  
  describe '#initialize' do
    describe 'with no args' do
      before do
        @questionnaire = Questionnaire.new
      end

      it "must respond to title" do
        @questionnaire.must_respond_to(:title)
      end
      
      it "must respond to questions" do 
        @questionnaire.must_respond_to(:questions)
      end
    end

    it  'must initialize with title' do
      @title = "Some title"
      @questionnaire = Questionnaire.new title: @title
      @questionnaire.title.must_equal @title
    end

    it 'must initialize with questions' do
      @questions = ['some question', 'another']
      @questionnaire = Questionnaire.new questions: @questions
      @questionnaire.questions.must_equal @questions
    end

  end  
end

