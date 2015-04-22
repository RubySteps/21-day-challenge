class Questionnaire
  
  attr_accessor :title
  attr_accessor :questions

  def initialize(arg_hash={})
    @title = arg_hash[:title]
    @questions = arg_hash[:questions]
  end
end

class Question

  attr_reader :sentence

  def initialize(arg_hash)
    @sentence = arg_hash[:sentence]
  end

end

class UserQuestionnaire

  attr_accessor :questionnaire
  
  def questions
    self.questionnaire.questions 
  end

  def answers
    []
  end

  def for_question(question)
    @questions_answers= self.answers.find do |questions_answers| 
      questions_answers.question == question
    end 
    if not @questions_answers 
      @questions_answers = QuestionsAnswers.new(
          user_questionnaire: self, question: question)
    end
    return @questions_answers
  end
end

class QuestionsAnswers

  attr_accessor :questionnaire
  attr_accessor :question
  attr_accessor :answer

  def initialize(arg_hash={})
    @questionnaire= arg_hash[:questionnaire]
    @question= arg_hash[:question]
    @answer= arg_hash[:answer]
  end
end

def create_questionnaire_from_hash(arg_hash={})
  @title = arg_hash[:title]
  @questions = []
  if arg_hash[:questions]
    arg_hash[:questions].each do |question_hash| 
      @questions.push(Question.new(question_hash))
    end
  end
  Questionnaire.new title: @title, questions: @questions
end


require 'yaml' 

questions_hash = ''
File.open('proust.yaml', mode='r') do |f|
  questions_hash = f.read
end
questions_from_yaml = YAML.load(questions_hash)
questions = questions_from_yaml.map do |question|
  {sentence: question["sentence"]}
end
questionnaire = create_questionnaire_from_hash questions: questions

questionnaire.questions.each do |question| 
  puts question.sentence
end


