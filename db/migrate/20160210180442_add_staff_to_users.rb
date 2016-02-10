class AddStaffToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :staff, :integer
  end
end
