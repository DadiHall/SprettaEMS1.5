class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :taggable,
             polymorphic: :true,
             inverse_of: :taggings
end