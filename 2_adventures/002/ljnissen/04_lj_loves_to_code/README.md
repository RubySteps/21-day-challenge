  def index
    @question = Question.first
    @questions = Question.all
    @surveys = Survey.all
    @survey = Survey.first
  end
