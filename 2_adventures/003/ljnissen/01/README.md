#Today I'm thinking about this code:

  def quiz_guess
    Answer.update_all({"guess" => true})
      redirect_to(:action => 'show', :survey_id => @survey.id)
  end
  
  # Now, I have a model called Answer with an boolean attribute "guess" that I would like to update with a check_box. How do I do that?
