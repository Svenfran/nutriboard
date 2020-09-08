class ChartPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def meal_calories?
    true
  end

  def total_calories?
    true
  end

  def total_nutrients?
    true
  end
end
