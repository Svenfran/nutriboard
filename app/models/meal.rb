class Meal < ApplicationRecord
  belongs_to :user
  has_many :foods
  has_many :nutrients, through: :foods, dependent: :destroy

  validates :name, :category, presence: true
end
