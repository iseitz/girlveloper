class SectionPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end
  
  def show?
   @user.present? && @record.course.user_id == @user.id || @user.present? && @user.has_role?(:admin) || @user.present? && @record.course.purchased(@user) == true
  end 
  
  def edit?
    @user.present? && @record.course.user_id == @user.id || @user.present? && @user.has_role?(:admin) 
  end
  
  def update?
    @record.course.user_id == @user.id || @user.has_role?(:admin) 
  end
  
  def new?
    @record.course.user_id == @user.id || @user.has_role?(:admin) 
  end
  
  def create?
    @record.course.user_id == @user.id || @user.has_role?(:admin) 
  end
  
  def destroy?
    @record.course.user_id == @user.id || @user.has_role?(:admin) 
  end
end