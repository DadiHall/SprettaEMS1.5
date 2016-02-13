class ChangeNameInTransportColumn < ActiveRecord::Migration
  def change
  	rename_column :transports, :transpor_km_recycled_fuel, :transport_km_recycled_fuel
  end
end
