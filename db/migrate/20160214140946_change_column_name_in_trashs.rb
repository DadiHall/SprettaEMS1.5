class ChangeColumnNameInTrashs < ActiveRecord::Migration
  def change
  	  	rename_table :trashes, :trashs

  end
end
