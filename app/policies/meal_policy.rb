class MealPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def index?
    true
  end

  def create?
    true
  end

  def update?
    user_owns_record?
  end

  def destroy?
    user_owns_record?
  end

  private

  def user_owns_record?
    record.user == user
  end
end
