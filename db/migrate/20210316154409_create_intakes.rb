class CreateIntakes < ActiveRecord::Migration[5.2]
  def change
    create_table :intakes do |t|
      t.float :calories
      t.string :time
      t.references :user

      t.timestamps
    end
  end
end
