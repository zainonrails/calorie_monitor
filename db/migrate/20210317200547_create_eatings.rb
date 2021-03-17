class CreateEatings < ActiveRecord::Migration[5.2]
  def change
    create_table :eatings do |t|
      t.bigint :eatable_id
      t.string :eatable_type
      t.float :quantity
      t.references :intake
      t.timestamps
    end
  end
end
