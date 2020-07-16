class DashboardController < ApplicationController
  def index
    @meals = Meal.all
  end
end
