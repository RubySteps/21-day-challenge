class Questionnaire
  
  attr_accessor :title
  attr_accessor :questions

  def initialize(arg_hash={})
    @title = arg_hash[:title]
    @questions = arg_hash[:questions]
  end
end
