class CreateTransports < ActiveRecord::Migration
  def change
    create_table :transports do |t|
      t.datetime :date
      t.string :transport_type
      t.decimal :transport_km
      t.decimal :transport_num_of_trips
      t.decimal :transpor_km_recycled_fuel
      t.decimal :transport_co2
      t.decimal :transport_km_staff_ratio
      t.decimal :transport_co2_staff_ratio
      t.string :transport_flight_type
      t.decimal :transport_flight_km
      t.decimal :transport_flight_co2
      t.decimal :transport_flight_km_staff_ratio
      t.decimal :transport_flight_co2_staff_ratio
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
