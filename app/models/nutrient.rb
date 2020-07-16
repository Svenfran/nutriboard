class Nutrient < ApplicationRecord
  belongs_to :food

  validates :name, :unit, presence: true
end
