class Eating < ApplicationRecord
  belongs_to :intake, inverse_of: :eatings
  belongs_to :eatable, polymorphic: true, optional: true
  scope :persisted_meals, -> { where(eatable_type: 'Meal') }

  def self.meals
    persisted_meals.present? ? persisted_meals : false
  end
end
