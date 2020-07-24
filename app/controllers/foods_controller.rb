require 'open-uri'
require 'json'

class FoodsController < ApplicationController
  before_action :set_food, only: %i[edit update destroy]

  def new
    @meal = Meal.find(params[:meal_id])
    @food = Food.new
    @nutrient = Nutrient.new
  end

  def create
    @meal = Meal.find(params[:meal_id])
    @food = Food.new(food_params)
    @food.meal = @meal
    food_nutrients = []

    respond_to do |format|
      if @food.save
        food_nutrients = fetch_ingredient_info(@food.name, @food.id, @food.amount)
        food_nutrients.each { |n| n.save }

        format.html { redirect_to meals_path(params[:id]), notice: 'Food was successfully created.' }
        format.json { render :index, status: :created, location: @food }
      else
        format.html { render :new }
        format.json { render json: @food.errors, status: :unprocessable_entity }
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

  def set_food
    @food = Food.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:name, :amount, :unit, :meal_id)
  end

  def fetch_ingredient_info(food, id, amount)
    app_id = ENV["APP_ID"]
    app_key = ENV["APP_KEY"]
    url = "https://api.edamam.com/api/food-database/v2/parser?ingr=#{food}&app_id=#{app_id}&app_key=#{app_key}"

    ingredient_serialized = open(url).read
    ingredient = JSON.parse(ingredient_serialized)

    unless ingredient['parsed'].empty?
      nutrients_arr = []
      nutrients = ['Energy', 'Protein', 'Fat', 'Carbohydrates', 'Fiber']

      ingredient['parsed'][0]['food']['nutrients'].each_with_index do |(k, v), i|
        
        nutrients_arr << Nutrient.new(
          name: nutrients[i],
          amount: (v / 100) * amount,
          unit: k == 'ENERC_KCAL' ? 'kcal' : 'g',
          food_id: id
        )
      end
    else
      respond_to do |format|
        format.html { render :new, notice: "We couldn't find your food!" }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
    nutrients_arr
  end
end
