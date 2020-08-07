class AutocompleteSearchService
  include HTTParty
  base_uri "http://api.edamam.com/"
  default_params limit: '10', app_id: ENV["APP_ID"], app_key: ENV["APP_KEY"]
  
  def initialize(term)
    @term = term
  end

  def call
    { foods: foods }
  end

  private

  def foods
    response = self.class.get("/auto-complete", query: { q: @term })
    response.map { |f| f }.take(10)
  end
end