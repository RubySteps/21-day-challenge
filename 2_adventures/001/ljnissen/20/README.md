  def create
      @survey = Survey.new(survey_params)
      @surveys = Survey.all
      if @survey.save
        flash[:notice] = 'Survey was successfully created.' 
        redirect_to(:controller => 'questions', :action => :new)
      else
        render('new') 
      end
  end
