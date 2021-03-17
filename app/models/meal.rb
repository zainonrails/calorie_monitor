class Meal < ApplicationRecord
  belongs_to :user
  has_many :meal_foods, inverse_of: :meal
  has_many :foods, through: :meal_foods
  accepts_nested_attributes_for :meal_foods
  has_many :eating, as: :eatable


  def calculate_calories
    sum = 0
    meal_foods.each do |mf|
      sum += ((mf.quantity.to_f / mf.food.quantity) * mf.food.calories)
    end
    self.calories = sum
    save
  end
end
