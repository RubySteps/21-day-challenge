Today I'm still thinking about this code:

  def quiz_guess
    #@answer = Answer.find(params[:id])
    if Answer.update(params[:question_id], :guess => true)
      redirect_to(:action => 'show', :survey_id => @survey.id)
    end
  end
