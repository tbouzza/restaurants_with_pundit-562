class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  # def edit?
  #   # the user allowed to edit is the user who created it
  #   # in pundit the current_user -> @user
  #   #               restaurant -> record

  #   # if @user == @record.user
  #   #   true
  #   # else
  #   #   false
  #   # end

  #   @user == @record.user
  # end

  def update?
    admin_or_owner?
  end

  def destroy?
    admin_or_owner?
  end

  private

  def admin_or_owner?
    @user == @record.user || @record.admin
  end
end
