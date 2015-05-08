  def index
    #@questions = Question.where(:survey_id => @survey.id)
    @question = Question.first
    @questions = Question.all
    @surveys = Survey.all
    @survey = Survey.first
  end
