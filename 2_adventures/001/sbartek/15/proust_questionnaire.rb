require 'yaml' 

require_relative 'create_questionnaire'
require_relative 'create_user_questionnaire'

questions_hash = ''
File.open('proust.yaml', mode='r') do |f|
  questions_hash = f.read
end
questions_from_yaml = YAML.load(questions_hash)
questions = questions_from_yaml.map do |question|
  {sentence: question["question_sentence"]}
end
questionnaire = create_questionnaire_from_hash questions: questions

questions_answers = questions_from_yaml.map do |question|
  { question_sentence: question["question_sentence"],
    answer: question['answer']
  }
end
user_questionnaire = create_user_questionnaire_from_hash(
    { user: "Proust",
     questionnaire: questionnaire,
     questions_answers: questions_answers
    }
) 



user_questionnaire.questions.each do |question| 
  puts "question: #{question.sentence}"
  puts "answer: #{user_questionnaire.for_question(question).answer}"
end
