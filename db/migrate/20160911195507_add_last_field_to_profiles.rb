class AddLastFieldToProfiles < ActiveRecord::Migration
  def change
  	add_column :profiles, :buisness_type_light, :string
  end
end
