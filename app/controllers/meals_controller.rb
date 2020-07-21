class MealsController < ApplicationController
  before_action :set_meal, only: %i[show edit update destroy]

  def index
    @meals = Meal.all
    @foods = Food.all
    @nutrients = Nutrient.all
  end

  def show; end
  
  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.user = current_user

    respond_to do |format|
      if @meal.save
        format.html { redirect_to meals_path(params[:id]), notice: 'Meal was successfully created.' }
        format.json { render :index, status: :created, location: @meal }
      else
        format.html { render :new }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
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
    params.require(:meal).permit(:name, :category)
  end

end
