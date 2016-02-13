class CreateHwaters < ActiveRecord::Migration
  def change
    create_table :hwaters do |t|
      t.datetime :date
      t.string :building_name
      t.decimal :hot_water_cost
      t.decimal :hot_water_cubic_meter
      t.decimal :hot_water_m2_m3_ratio
      t.decimal :hot_water_m3_staff_ratio
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
