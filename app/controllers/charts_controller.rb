class ChartsController < ApplicationController
  def new_meals
    render json: Meal.group(:name).count
  end

  def new_foods
    render json: Food.group(:name).count
  end

  def new_nutrients
    render json: Nutrient.group(:name).sum(:amount)
  end
end
