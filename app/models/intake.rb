class Intake < ApplicationRecord
  belongs_to :user
  has_many :eatings, inverse_of: :intake
  accepts_nested_attributes_for :eatings, reject_if: proc { |attributes| attributes['eatable_type'] == 'Food' && attributes['quantity'].blank? }

  def calculate_calories

  end
end
