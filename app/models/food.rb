class Food < ApplicationRecord
  belongs_to :meal
  has_many :nutrients
end
