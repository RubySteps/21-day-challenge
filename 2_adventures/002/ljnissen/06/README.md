# Today I'm thinking about different behaviors but same controller.

def index
    @surveys = Survey.all
    #@survey = Survey.last
    @question = Question.first
    @questions = Question.where(:survey_id => @survey.id).all
    #@questions = @survey.questions
    #@questions = Question.where(:survey_id => @survey.id)

  end
