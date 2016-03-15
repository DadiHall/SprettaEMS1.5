class AddTimestampsToCleaning < ActiveRecord::Migration
  def change
    add_column :cleanings, :created_at, :datetime
    add_column :cleanings, :updated_at, :datetime
  end
end
