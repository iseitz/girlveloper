module CoursesHelper
  def enrollment_button(course)
    if current_user
      #logic to buy
      if course.user == current_user
        link_to "You created this course. View detils and analytics", course_path(course)
      elsif course.enrollments.where(user: current_user).any?
        link_to "You already purchased this course. Start learning", course_path(course)
      elsif course.price > 0
        link_to number_to_currency(course.price), new_course_enrollment_path(course), class: 'btn btn-success'
      else
        link_to "Free", new_course_enrollment_path(course), class: 'btn btn-success'
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
end