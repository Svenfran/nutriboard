class ChartsController < ApplicationController
  def meal_calories
    skip_authorization
    @meals = policy_scope(Meal)
    data = {}
    @meals.each do |meal|
      data[meal.category] = meal.nutrients.where(nutrients: {name: 'Energy'}).sum(:amount)
    end
    render json: data.sort_by {|k, v| -v}
  end
  
  def total_calories
    skip_authorization
    @nutrients = current_user.nutrients
    render json: @nutrients.where(name: 'Energy').group(:name).sum(:amount)
  end
  
  def total_nutrients
    skip_authorization
    @nutrients = current_user.nutrients
    render json: @nutrients.where.not(name: 'Energy').where.not(name: 'Fiber').group(:name).sum(:amount).sort_by {|k, v| -v}
  end
end
