class SitesController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]
  def index 
    @courses = Course.all.limit(3)
    @latest_courses = Course.all.limit(3).order(created_at: :desc)
  end
  
  def activity
    redirect_to root_path, alert: 'You are not authorized to access this page' unless current_user.has_role?(:admin)
    @pagy, @activities = pagy(PublicActivity::Activity.all.order(created_at: :desc))
  end
end
