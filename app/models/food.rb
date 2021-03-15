class Food < ApplicationRecord
  belongs_to :user
  has_many :meal_foods
  has_many :meals, through: :meal_foods
  # has_many :intake, as: :eatable
end
