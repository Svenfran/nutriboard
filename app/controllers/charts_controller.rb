class ChartsController < ApplicationController
  def meal_calories
    @meals = Meal.all
    data = {}
    @meals.each do |meal|
      if meal.user == current_user
        data[meal.name] = meal.nutrients.where(nutrients: {name: 'Energy'}).sum(:amount)
      end
    end
    render json: data.sort_by {|k, v| -v}
  end

  def total_calories
    render json: Nutrient.where(name: 'Energy').group(:name).sum(:amount).sort_by {|k, v| -v}
  end

  def total_nutrients
    render json: Nutrient.where.not(name: 'Energy').where.not(name: 'Fiber').group(:name).sum(:amount).sort_by {|k, v| -v}
  end
end
