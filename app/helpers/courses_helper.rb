module CoursesHelper
  def enrollment_button(course)
    if current_user
      #logic to buy
      if course.user == current_user
        link_to "View details and analytics", course_path(course), class: 'btn btn-success'
      elsif course.enrollments.where(user: current_user).any?
        link_to "Go to course and start learning", course_path(course)
      elsif course.price > 0
        link_to "Enroll for #{number_to_currency(course.price)}", new_course_enrollment_path(course), class: 'btn btn-success'
      else
        link_to "Enroll now for Free", new_course_enrollment_path(course), class: 'btn btn-success'
      end
    else
      link_to "Check price", course_path(course), class: "btn btn-md btn-success"
    end
  end
  
  def total_lectures(course)
    @lectures = 0
    course.sections.each{|section| @lectures += section.lessons.count}
    return @lectures
  end
  
  def review_button(course)
    user_course = course.enrollments.where(user: current_user)
    if current_user
      if user_course.any?
        if user_course.missing_review.any?
          link_to  edit_enrollment_path(course.enrollments.where(user: current_user).first) do
            'Add a review'
          end
        else 
          link_to enrollment_path(user_course.first) do
            "See or edit your review"
          end
        end
      end 
    end 
  end
end