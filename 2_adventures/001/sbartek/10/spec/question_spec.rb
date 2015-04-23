require_relative 'helper'

describe Question do

  before do 
    @sentence = "Some sentence"
    @question = Question.new sentence: @sentence
  end

  it "must respond to sentence" do
    @question.must_respond_to(:sentence)
  end

  describe 'when asked about sentence' do
    it "must be equal to passed one" do
      @question.sentence.must_equal @sentence
    end
  end
end

