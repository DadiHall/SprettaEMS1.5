class AddFieldToCleanings < ActiveRecord::Migration
  def change
  	add_column :cleanings, :env_clean_ratio, :decimal
  end
end
