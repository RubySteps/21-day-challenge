Today I'm thinking about this code:

  def check
    @answer = Answer.find(params[:id])
    @correct = (params[:guess] == @answers.correct_answer) 
  end
