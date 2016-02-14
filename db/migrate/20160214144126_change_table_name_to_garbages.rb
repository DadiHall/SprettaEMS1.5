class ChangeTableNameToGarbages < ActiveRecord::Migration
  def change
  	rename_table :trashes, :garbages
  end
end
