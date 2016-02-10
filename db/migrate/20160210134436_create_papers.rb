class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.string :paper_type
      t.decimal :paper_weight
      t.decimal :paper_cost
      t.decimal :paper_weight_staff_ratio
      t.decimal :env_paper_weight
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
