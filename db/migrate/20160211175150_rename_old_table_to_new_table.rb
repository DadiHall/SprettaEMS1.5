class RenameOldTableToNewTable < ActiveRecord::Migration
  def change
  	rename_table :elecricities, :electros
  end
end
