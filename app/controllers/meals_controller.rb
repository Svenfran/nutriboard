class MealsController < ApplicationController
  before_action :set_meal, only: %i[show edit update destroy]

  def index
    @meals = Meal.all
    @foods = Food.all
    @nutrients = Nutrient.all
  end

  def show
  end
  
  def new
  end

  def create
  end
  
  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_meal
    @meal = Meal.find(params[:id])
  end

  def meal_params
    params.require(:meal).permit(params[:category, :name, :user_id])
  end

end
