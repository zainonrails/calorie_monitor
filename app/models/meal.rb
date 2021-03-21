class Meal < ApplicationRecord
  belongs_to :user
  has_many :meal_foods, inverse_of: :meal, dependent: :delete_all
  has_many :foods, through: :meal_foods
  accepts_nested_attributes_for :meal_foods, allow_destroy: true
  has_many :eatings, as: :eatable, foreign_key: 'eatable_id'

  scope :user_meals, ->(id) { select('id', "CONCAT(name, ' - ',calories) as text").where(user_id: id) }

  def calculate_calories
    sum = 0
    meal_foods.each do |mf|
      sum += ((mf.quantity.to_f / mf.food.quantity).to_f * mf.food.calories)
    end
    self.calories = sum
    save
  end


end
