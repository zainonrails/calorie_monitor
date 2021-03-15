module Meals
  class MealFoodsCreator
    attr_accessor :meal, :food_ids, :res

    def initialize(meal, food_ids)
      self.meal = meal
      self.food_ids = food_ids
      self.res = {}
    end

    def self.call(meal, food_ids)
      obj = new(meal, food_ids)
      obj.call
      obj
    end

    def call
      food_ids.each do |food_id|
        meal.meal_foods.create(food_id: food_id)
      end

    end
  end
end