class ChartsController < ApplicationController

  def users_per_day
    render json: User.group_by_day(:created_at).count
  end

  def enrollments_per_day
    render json: Enrollment.group_by_day(:created_at).count
  end

  def course_enrollments_total
    render json: Enrollment.joins(:course).group(:'courses.title').count
  end
  
  def biggest_revenue
    render json: Enrollment.joins(:course).group(:'courses.title').sum(:price)
  end

end