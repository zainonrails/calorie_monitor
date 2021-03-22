class Intake < ApplicationRecord
  belongs_to :user
  has_many :eatings, inverse_of: :intake, dependent: :delete_all
  accepts_nested_attributes_for :eatings,
                                allow_destroy: true,
                                reject_if: :validate_eatable_attributes

  #
  # An intake has many foods/meals through eatings (table), and the way to find
  # these foods/meals is to look for eatables from eatings that belong to the intake with type Food/Meal.
  #
  #
  has_many :foods, through: :eatings, as: :eatable, source: :eatable, source_type: 'Food'
  has_many :meals, through: :eatings, as: :eatable, source: :eatable, source_type: 'Meal'

  def calculate_calories
    sum = 0
    eatings.each do |f|
      if f.eatable_type == 'Food'
        sum += ((f.quantity.to_f / f.eatable.quantity).to_f * f.eatable.calories)
      end
    end
    sum += meals.sum(&:calories)
    self.calories = sum
    save
  end

  def validate_eatable_attributes(attributes)
    case attributes['eatable_type']
    when 'Food'
      attributes['quantity'].blank?
    when 'Meal'
      attributes['eatable_id'].blank?
    end
  end

  def self.group_by_data(start_date, end_date, group_by, user_id)
    where(user_id: user_id).select('sum(calories) as calories', "DATE_TRUNC('#{group_by}', date) as date")
                           .where(date: start_date..end_date)
                           .group("DATE_TRUNC('#{group_by}', date)").to_a
  end
end
