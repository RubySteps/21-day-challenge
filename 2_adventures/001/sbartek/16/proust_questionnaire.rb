require 'yaml' 

require_relative 'create_questionnaire'
require_relative 'create_user_questionnaire'
require_relative 'app/models/user_questionnaire'


proust_fn = 'proust_short.yaml'



# fn = ARGV[0] 
# if not fn or not File.exists?(fn)
#   fn = proust_fn
# end

fn = proust_fn

questions_hash = ''
File.open(fn, mode='r') do |f|
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


proust_questionnaire = create_user_questionnaire_from_hash(
    { user: "Proust",
     questionnaire: questionnaire,
     questions_answers: questions_answers
    }
) 

puts "What is your name?"
user_name = gets

user_questionnaire = UserQuestionnaire.new user: user_name, 
  questionnaire: questionnaire

puts "Hi #{user_name}"
puts "Please now answer the following questions."
questionnaire.questions.each do |question| 
  puts "#{question.sentence}"
  answer = gets
  user_questionnaire.for_question(question).answer= answer
end

questionnaire.questions.each do |question| 
  puts "Question: #{question.sentence}"
  puts "Your answer: #{user_questionnaire.for_question(question).answer}"
  puts "Proust answer: #{proust_questionnaire.for_question(question).answer}"
end
