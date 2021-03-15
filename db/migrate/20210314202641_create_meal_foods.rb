class CreateMealFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :meal_foods do |t|
      t.references :food
      t.references :meal
      t.float :quantity
      t.timestamps
    end
  end
end
