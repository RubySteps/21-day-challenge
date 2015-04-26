require 'minitest/autorun'

require_relative 'questionnaire'

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

describe Question do

  before do 
    @sentence = "Some sentence"
    @question = Question.new sentence: @sentence
  end

  it "must respond to sentence" do
    @question.must_respond_to(:sentence)
  end

  describe 'when asked about sentence' do
    it "must responds #{@sentence}" do
      @question.sentence.must_equal @sentence
    end
  end
end

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
