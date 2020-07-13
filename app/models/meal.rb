class Meal < ApplicationRecord
  belongs_to :user
  has_many :foods
  has_many :nutrients, through: :foods
end
