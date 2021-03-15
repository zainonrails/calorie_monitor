class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.string :name
      t.text :description
      t.float :calories
      t.references :user
      t.timestamps
    end
  end
end
