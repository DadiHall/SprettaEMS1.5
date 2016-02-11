class CreateElecricities < ActiveRecord::Migration
  def change
    create_table :elecricities do |t|
      t.datetime :date
      t.string :building_name
      t.decimal :electricity_kwst
      t.decimal :electricity_cost
      t.decimal :kwst_staff_ratio
      t.decimal :kwst_square_meter_ratio
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
