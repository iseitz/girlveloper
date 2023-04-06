class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_global_variables
  
  def set_global_variables
    @ransack_courses = Course.ransack(params[:courses_search], search_key: :courses_search) #navbar search
  end
  
  def index
  end
end
