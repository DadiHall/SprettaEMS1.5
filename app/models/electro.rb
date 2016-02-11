class Electro < ActiveRecord::Base
	belongs_to :user

	def electro_per_capita(current_user)
		electricity_kwst.to_i / current_user.staff
	end	
end
