class LessonPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end
  
  def show?
    # binding.pry
    @record.section.course.user_id == @user.id || @user.has_role?(:admin) || @record.section.course.purchased(@user) == true
  end 
  
  def edit?
    @record.section.course.user_id == @user.id || @user.has_role?(:admin) 
  end
  
  def update?
    @record.section.course.user_id == @user.id || @user.has_role?(:admin) 
  end
  
  def new?
   @record.section.course.user_id == @user.id || @user.has_role?(:admin) 
  end
  
  def create?
    @record.section.course.user_id == @user.id || @user.has_role?(:admin) 
  end
  
  def destroy?
    @record.section.course.user_id == @user.id || @user.has_role?(:admin) 
  end
end