require_relative 'app/models/question'
require_relative 'app/models/questionnaire'

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

# questionnaire.questions.each do |question| 
#   puts question.sentence
# end
