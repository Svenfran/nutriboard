class Food < ApplicationRecord
  belongs_to :meal
  has_many :nutrients

  validates :name, :unit, presence: true
end
