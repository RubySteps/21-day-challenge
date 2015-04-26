require 'minitest/autorun'

class Questionnaire
  
  attr_accessor :title
  attr_accessor :questions

  def initialize(title="")
    @title = title
    @quesitons = []
  end
end

class Question

  attr_reader :sentence

  def initialize(sentence)
    @sentence = sentence
  end

end

describe Questionnaire do
  
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

describe Question do

  before do 
    @sentence = "Some sentence"
    @question = Question.new(@sentence)
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

