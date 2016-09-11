class AddFieldsToProfiles < ActiveRecord::Migration
  def change
  	add_column :profiles, :permit_duration, :datetime
  	add_column :profiles, :board_member, :text
  	add_column :profiles, :permit_publisher, :string
    add_column :profiles, :permit_monitor, :string
  end
end
