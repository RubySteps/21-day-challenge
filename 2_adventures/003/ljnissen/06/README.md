Today I'm wondering why Rails asks me to add a template file to this code:

  def quiz_guess
    @answer = Answer.find(params[:id])
    # if check_box({:guess => true, :id => @answer.id}, :method => :get)
    Answer.update_column(:guess, true) 
       puts("Guess saved")
  end
