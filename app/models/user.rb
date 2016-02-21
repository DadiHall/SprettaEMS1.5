class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
has_many :papers 
has_many :cleanings
has_many :electros
has_many :hwaters
has_many :transports
has_many :garbages

has_many :friendships
has_many :friends, through: :friendships
has_many :posts
has_many :comments

has_one :profile

	def not_friends_with?(friend_id)
		friendships.where(friend_id: friend_id).count < 1

	end

	def except_current_user(users)
		users.reject { |user| user.id == self.id }
	end

	def self.search(param)
		return User.none if param.blank?

		param.strip!
		param.downcase!
		(name_matches(param) + email_matches(param)).uniq
	end
	
	def self.name_matches(param)
		matches('name', param)
	end

	def self.email_matches(param)
		matches('email', param)
	end	

	def self.matches(field_name, param)
		where("lower(#{field_name}) like ?", "%#{param}%")
	end
end
