class QuestionAnswer

  attr_accessor :user_questionnaire
  attr_accessor :question
  attr_accessor :answer

  @@all = []

  def initialize(arg_hash={})
    @user_questionnaire= arg_hash[:user_questionnaire]
    @question= arg_hash[:question]
    @answer= arg_hash[:answer]
    @@all.push(self)
  end

  def self.all
    @@all
  end

end
