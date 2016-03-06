class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  has_many :taggings 
  has_many :tags, through: :taggings

  def self.tagged_with(name)
    ids = Tagging.where(taggable_type: self.name)
            .joins(:tag)
            .where(tags: {name: name}).pluck(:taggable_id)
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
end