class AddPostIdToTaggings < ActiveRecord::Migration
  def change
    add_reference :taggings, :post, index: true, foreign_key: true
  end
end
