class AddIsDefaultToFoods < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :is_default, :boolean
  end
end
