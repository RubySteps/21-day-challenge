  def update
    #Find an existing object using form parameters
    @survey = Survey.find(params[:id])
    #Update the object
    if @survey.update_attributes(survey_params)
      flash[:notice] = "Survey updated successfully."
      #If update succeeds, redirect to 'show' action.
      redirect_to(:action => 'show', :id => @survey.id)
    else
      #Else redisplay the 'edit' form.
      @survey_count = Survey.count
      render('edit')
    end
  end
