class AddDateToPaper < ActiveRecord::Migration
  def change
  	add_column :papers, :date, :datetime
  end
end
