class Food < ApplicationRecord
  belongs_to :meal
  has_many :nutrients, dependent: :destroy

  validates :name, :unit, presence: true
end
