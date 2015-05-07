# what's the difference between:

@questions = @survey.questions.all

and:

@questions = Question.where(:survey_id => @survey.id) ?
