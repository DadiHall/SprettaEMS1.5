class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
    	t.integer :user_id
    	t.string :name
    	t.string :address
    	t.string :postalcode
    	t.string :website
    	t.string :contact_person
    	t.string :contact_email
    	t.string :phone_number
    	t.string :buisness_type

    	t.text :description

    	t.timestamps
    end
  end
end
