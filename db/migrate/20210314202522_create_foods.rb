class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :name
      t.float :calories
      t.float :water
      t.float :proteins
      t.float :carbs
      t.float :calcium
      t.float :phosphorus
      t.float :sodium
      t.float :iron
      t.float :fat
      t.float :potassium
      t.float :quantity
      t.references :user
      t.timestamps
    end
  end
end
