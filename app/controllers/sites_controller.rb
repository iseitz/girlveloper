class SitesController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]
  def index 
    @courses = Course.all.limit(5)
    @latest_with_good_reviews = Enrollment.reviewed.latest_good_reviews
    @latest = Course.latest
    @enrollments = Enrollment.reviewed.order(rating: :desc, created_at: :desc).limit(5)
    @top_rated = Course.top_rated
    @popular = Course.popular
    @purchased_courses = Course.joins(:enrollments).where(enrollments: {user: current_user}).order(created_at: :desc).limit(5)
  end
  
  def activity
    redirect_to root_path, alert: 'You are not authorized to access this page' unless current_user.has_role?(:admin)
    @pagy, @activities = pagy(PublicActivity::Activity.all.order(created_at: :desc))
  end
end
