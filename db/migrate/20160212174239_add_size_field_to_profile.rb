class AddSizeFieldToProfile < ActiveRecord::Migration
  def change
  	add_column :profiles, :building_size, :decimal
  end
end
