Today I'm thinking about improving this code:

  def quiz_guess
    Answer.update(params[:answers].keys, params[:answers].values)
    flash[:notice] = "Guess saved successfully."
    redirect_to(questions_url)
    # :id => @survey.next, :survey_id => @survey.id
    # 
  end
