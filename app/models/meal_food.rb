class MealFood < ApplicationRecord
  belongs_to :food
  belongs_to :meal, optional: true
end
