require 'minitest/autorun'

class Question

  attr_reader :sentence

  def initialize(sentence)
    @sentence = sentence
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
      @quesiton.sentence.must_equal @sentence
    end
  end
end

