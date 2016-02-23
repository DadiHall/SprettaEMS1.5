class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments

	has_many :taggings, as: :taggable
	has_many :tags, through: :taggings

  #acts_as_taggable_on :tags

	def self.tagged_with(name)
    # We have to do this in two queries since Rails does not
    # do joins on polymorphic relations.
    ids = Tagging.where(taggable_type: self.name)
           .joins(:tag)
           .where(tags: { name: name }).pluck(:taggable_id)
    find(ids)
  end

  def self.tag_counts
    Tag.select("tags.id, tags.name,count(taggings.tag_id) as count").
    joins(:taggings).group("taggings.tag_id, tags.id, tags.name")
  end

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end

	#acts_as_taggable_on :tags

	#def tag_list=(names)
  		#self.tags = names.split(",").map do |name|
      		#Tag.where(name: name.strip).first_or_create!
  		#end
	#end

	#def tag_list
  		#self.tags.map(&:name).join(", ")
	#end

	#def self.tagged_with(name)
  		#Tag.find_by_name!(name).posts
	#end
end
