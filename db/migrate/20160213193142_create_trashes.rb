class CreateTrashes < ActiveRecord::Migration
  def change
    create_table :trashes do |t|
      t.datetime :date
      t.string :trash_type
      t.decimal :trash_weight
      t.decimal :trash_cost
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
