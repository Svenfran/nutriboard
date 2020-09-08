class MealsController < ApplicationController
  before_action :set_meal, only: %i[show edit update destroy]

  def index
    @meals = policy_scope(Meal).order(created_at: :asc)
    @foods = policy_scope(Food)
    @nutrients = policy_scope(Nutrient)
  end

  def show; end
  
  def new
    @meal = Meal.new
    authorize @meal
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.user = current_user
    authorize @meal

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
  
  def edit; end

  def update
    respond_to do |format|
      if @meal.update(meal_params)
        format.html { redirect_to meals_path(params[:id]), notice: 'Meal was successfully updated.' }
        format.json { render :index, status: :created, location: @meal }
      else
        format.html { render :edit }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @meal.destroy
    redirect_to meals_path
  end

  private

  def set_meal
    @meal = Meal.find(params[:id])
    authorize @meal
  end

  def meal_params
    params.require(:meal).permit(:name, :category)
  end
end
