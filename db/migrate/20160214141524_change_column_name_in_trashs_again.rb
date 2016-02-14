class ChangeColumnNameInTrashsAgain < ActiveRecord::Migration
  def change
  	rename_table :trashs, :trashes
  end
end
