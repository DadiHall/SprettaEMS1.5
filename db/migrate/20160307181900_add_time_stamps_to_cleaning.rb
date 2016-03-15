class AddTimeStampsToCleaning < ActiveRecord::Migration
  def change_table
  	add_column(:cleanings, :created_at, :datetime)
      add_column(:cleanings, :updated_at, :datetime)
  end
end
