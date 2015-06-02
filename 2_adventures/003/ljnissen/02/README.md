 def quiz
    @answer = Answer.find(params[:id])
    if @answer.update({:guess => true, :check_id => @answer.id})
      redirect_to(:action => 'show', :survey_id => @survey.id)
    end
  end
