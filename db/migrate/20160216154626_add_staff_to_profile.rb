class AddStaffToProfile < ActiveRecord::Migration
  def change
  	  	add_column :profiles, :staff, :integer
  end
end
