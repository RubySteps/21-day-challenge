Today I'm thinking about why this code in the controller gives a NoMethodError for nil:NilClass

  def quiz_guess
    Answer.update(params[:answers].keys, params[:answers].values)
    flash[:notice] = "Guess saved successfully."
    redirect_to(questions_path(:survey_id => @survey.id))
  end
  
whereas this code redirects to my index action without problems:

  def quiz_guess
    Answer.update(params[:answers].keys, params[:answers].values)
    flash[:notice] = "Guess saved successfully."
    redirect_to(questions_path)
  end

