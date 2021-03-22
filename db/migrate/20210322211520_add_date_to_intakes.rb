class AddDateToIntakes < ActiveRecord::Migration[5.2]
  def change
    add_column :intakes, :date, :datetime
  end
end
