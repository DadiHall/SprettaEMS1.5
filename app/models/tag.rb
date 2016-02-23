class Tag < ActiveRecord::Base
	has_many :taggings
	

	def self.tag_counts
    select("tags.*, count(taggings.tag_id) as count")
      .joins(:taggings)
      .group("taggings.tag_id")
   end
end
