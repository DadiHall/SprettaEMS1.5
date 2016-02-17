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

has_one :profile
end
