class CoursePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end
  
  def create?
    @user.has_role?(:admin) || @user.has_role?(:teacher)
  end
  
  def update?
    @user.has_role?(:admin) || (@record.user == @user)
  end
  
  def edit?
    @user.has_role?(:admin) || (@record.user == @user)
  end
  
  def new?
    @user.has_role?(:admin) || @user.has_role?(:teacher)
  end
  
  def destroy?
   @user.has_role?:admin
  end
  
  def owner?
    @user.has_role?(:admin) || (@record.user == @user)
  end
  
  def approve?
    @user.has_role?(:admin)
  end
  
  def show?
    @record.published && @record.approved || 
    user.present? && @user.has_role?(:admin) ||
    @user.present? && @record.user_id == @user.id ||
    @user.present? && @record.purchased(@user)
  end
end
