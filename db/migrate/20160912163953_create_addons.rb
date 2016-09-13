class CreateAddons < ActiveRecord::Migration
  def change
    create_table :addons do |t|

      t.string :addon_1
      t.string :addon_2
      t.string :addon_3
      t.string :addon_4

      t.timestamps null: false
    end
  end
end
