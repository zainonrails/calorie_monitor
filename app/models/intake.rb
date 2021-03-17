class Intake < ApplicationRecord
  belongs_to :user
  has_many :eatings, inverse_of: :intake
  accepts_nested_attributes_for :eatings

  def calculate_calories

  end
end
