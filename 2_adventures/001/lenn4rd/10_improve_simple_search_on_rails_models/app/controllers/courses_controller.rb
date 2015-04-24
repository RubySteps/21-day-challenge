class CoursesController < ApplicationController
  before_action :set_categories, only: [:index, :new, :create, :edit, :update]
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  
  def index
    @search = CourseSearch.new(search_params)
    @courses = @search.results
  end

  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_categories
    @categories = Category.order(:name).pluck(:name, :id)
  end
  
  def set_course
    @course = Course.find(params[:id])
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def course_params
    params.require(:course).permit(:category_id, :title, :status)
  end
  
  def search_params
    @search_params ||= params.delete(:course_search) || {}
  end
end
