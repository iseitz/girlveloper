class EnrollmentPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end
  
   def index?
     @user.has_role?(:admin) 
   end 
  
  def edit?
    @record.user_id == @user.id || @user.has_role?(:admin) 
  end
  
  def update?
    @record.user_id == @user.id || @user.has_role?(:admin) 
  end
  
  # def new?
  # @record.section.course.user_id == @user.id || @user.has_role?(:admin) 
  # end
  
  # def create?
  #   @record.section.course.user_id == @user.id || @user.has_role?(:admin) 
  # end
  
  def destroy?
    @user.has_role?(:admin) 
  end
end