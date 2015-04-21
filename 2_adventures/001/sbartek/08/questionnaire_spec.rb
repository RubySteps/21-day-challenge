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
    it "must be equal to passed one" do
      @question.sentence.must_equal @sentence
    end
  end
end

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

    describe 'we set set answer to a question' do
      it 'must have set answer to question' do
        @answer = "A1"
        @user_questionnaire.for_question(@question1).answer= @answer
        @user_questionnaire.for_question(@question1).answer.must_equal(@answer)
      end
    end
  end
end

describe QuestionsAnswers do

  before do 
    @question = 'Q'
    @questionnaire = 'QA'
    @answer = 'A'
  end

  describe 'initialize with no args' do
    before do
      @questions_answers = QuestionsAnswers.new
    end

    it 'must respond to question' do
      @questions_answers.must_respond_to(:question)
    end

    it 'must respond to answer' do
      @questions_answers.must_respond_to(:answer)
    end

    it 'must respond to questionnaire' do 
      @questions_answers.must_respond_to(:questionnaire)
    end

    it 'must be able to set question, answer, questionnaire' do
      @questions_answers.question= @question
      @questions_answers.answer= @answer
      @questions_answers.questionnaire= @questionnaire
      @questions_answers.question.must_equal(@question)
      @questions_answers.answer.must_equal(@answer)
      @questions_answers.questionnaire.must_equal(@questionnaire)
    end
  end

  describe 'initialize with args' do
    before do
      @questions_answers = 
        QuestionsAnswers.new({
          question: @question, answer: @answer, 
          questionnaire: @questionnaire})
    end

    it 'must have question, answer, questionnaire as was set' do
      @questions_answers.question.must_equal(@question)
      @questions_answers.answer.must_equal(@answer)
      @questions_answers.questionnaire.must_equal(@questionnaire)
    end

    it 'must respond to answer' do
      @questions_answers.must_respond_to(:answer)
    end

    it 'must respond to questionnaire' do 
      @questions_answers.must_respond_to(:questionnaire)
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

