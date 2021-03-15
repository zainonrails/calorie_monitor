module FoodsHelper
  def food_select(foods)
    foods.map { |food| [food.text, food.id] }
  end
end
