module FoodsHelper
  def food_select(foods)
    foods.map { |food| [food.text, food.id] }
  end

  def food_calorie(meal_food)
    ((meal_food.quantity.to_f / meal_food.food.quantity).to_f * meal_food.food.calories)
  end
end
