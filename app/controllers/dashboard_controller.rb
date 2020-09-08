class DashboardController < ApplicationController
  
  def index
    @meals = policy_scope(Meal)
  end
end
