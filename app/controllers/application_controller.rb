class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  
  before_action :set_global_variables
  
  include PublicActivity::StoreController #save current_user using gem public_activity
  
  include Pundit::Authorization
  # protect_from_forgery
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    
  include Pagy::Backend
    
  after_action :user_activity

  def set_global_variables
    @ransack_courses = Course.ransack(params[:courses_search], search_key: :courses_search) #navbar search
  end
  
  def index
  end
  
  private

  def user_not_authorized #pundit
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back(fallback_location: root_path)
  end
  
  def user_activity
    current_user.try :touch
  end
end
