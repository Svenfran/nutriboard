class FoodsController < ApplicationController
  before_action :set_food, only: %i[edit update destroy]

  def new
    @meal = Meal.find(params[:meal_id])
    @food = Food.new
  end

  def create
    @meal = Meal.find(params[:meal_id])
    @food = Food.new(food_params)
    @food.meal = @meal
    @food.save
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_food
    @food = Food.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:name, :amount, :unit, :meal_id)
  end
end
