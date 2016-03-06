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

has_many :pages

has_many :friendships, dependent: :destroy
has_many :friends, through: :friendships
has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
has_many :inverse_friends, through: :inverse_friendships, :source => :user

has_many :posts
has_many :comments

has_one :profile

acts_as_messageable

	def average_paper_types
  		self.papers.group(:paper_type).sum(:paper_weight)
	end

	def average_transport_types
  		self.transports.group(:transport_type).sum(:transport_km) 
	end


	def mailboxer_email(object)
		object.email
	end
	#def not_friends_with?(friend_id)
		#friendships.where(friend_id: friend_id).count < 1

	#end

	#def except_current_user(users)
	#	users.reject { |user| user.id == self.id }
	#end

	#def self.search(param)
		#return User.none if param.blank?

		#param.strip!
		#param.downcase!
		#(name_matches(param) + email_matches(param)).uniq
	#end
	
	#def self.name_matches(param)
	#	matches('name', param)
	#end

	#def self.email_matches(param)
	#	matches('email', param)
	#end	
#
	#def self.matches(field_name, param)
		#where("lower(#{field_name}) like ?", "%#{param}%")
	#end
end
