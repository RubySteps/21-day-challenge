Today I'm thinking about this code:

class QuestionsController < ApplicationController
  #before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :find_survey
  
  def index
    #@questions = Question.where(:survey_id => @survey.id)
    @question = Question.where(:survey_id => @survey.id)
    @questions = Question.all
    @surveys = Survey.all
    @survey = Survey.first
  end

  def show
    @answer = Survey.find(params[:id])
    @answers = Answer.where(:survey_id => @survey.id)
    @question = Survey.find(params[:id])
    @questions = Question.where(:survey_id => @survey.id)
    @surveys = Survey.all
    @survey = Survey.find(params[:id])
  end

  def new
    @questions = Question.all
    @question = Question.new(:survey_id => @survey.id)
    1.times do
      question = @survey.questions.build
      4.times { question.answers.build }
    end
  end

  # POST /surveys
  # POST /surveys.json
  def create
      @question = Question.new(question_params)
      @survey = Survey.find(params[:id])
      @surveys = Survey.all
      @questions = Question.all
      if @question.save
        flash[:notice] = 'Question was successfully created.' 
        redirect_to(:controller => 'surveys', :action => 'index', :survey_id => @survey.id)
      else
        
        render('new') 
      end
  end

  # GET /surveys/1/edit
  def edit
    @question = Question.find(params[:id])
    @surveys = Survey.all
    @page_count = Page.count
  end

  # PATCH/PUT /surveys/1
  # PATCH/PUT /surveys/1.json
  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      flash[:notice] = "Question updated successfully."
      redirect_to(:action => 'show', :id => @question.id, :survey_id => @survey.id)
    else
      @surveys = Survey.all
      @page_count = Page.count
      render('edit')
    end
  end 

  def check
    
  end

  def delete
    @question = Question.find(params[:id])
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    @question = Question.find(params[:id]).destroy
    flash[:notice] = "Question destroyed successfully."
    redirect_to(:action => 'index', :survey_id => @survey.id)
  end

  def quiz_guess
    @answer = Answer.find(params[:id])
    redirect_to(:action => 'show', :survey_id => @survey.id)
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit( questions_attributes: [:survey_id, :id, :content, answers_attributes: [:id, :question_id, :correct_answer, :content, :guess], correct_answers_attributes: [:guess, :question_id]])
    end

    def find_survey
      # If in each action calling this method (find_survey) has :survey_id sent
      if params[:survey_id]
        # We will then go to the database and look for (and find) :survey_id and set that to @survey. 
        @survey = Survey.find(params[:survey_id])
      end
    end
end
