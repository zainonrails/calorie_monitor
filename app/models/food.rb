class Food < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search, against: :name, using: {
    tsearch: {dictionary: "english", any_word: true }
  }, ignoring: :accents
  belongs_to :user
  has_many :meal_foods
  has_many :meals, through: :meal_foods
  has_many :eatings, as: :eatable, foreign_key: 'eatable_id'

  scope :default_foods, -> { select('id', 'name as text').where(is_default: true) }
  scope :user_foods, ->(id) { select('id', 'name as text').where(user_id: id, is_default: false) }


  def self.format_for_dropdown(foods_to_format)
    drop_down_foods = []
    foods_to_format.each do |food|
      drop_down_foods << [food.text, food.id]
    end
    drop_down_foods
  end
end
