class AddMoreFieldsToProfiles < ActiveRecord::Migration
  def change
  	add_column :profiles, :need_permit, :string
  end
end
