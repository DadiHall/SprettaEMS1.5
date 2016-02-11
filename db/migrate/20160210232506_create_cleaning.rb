class CreateCleaning < ActiveRecord::Migration
  def change
    create_table :cleanings do |t|
      t.datetime :date	
      t.string :cleaning_type
      t.decimal :cleaning_liter
      t.decimal :cleaning_cost
      t.decimal :cleaning_liter_staff_ratio
      t.integer :user_id
    end
  end
end
