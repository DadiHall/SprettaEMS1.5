class Electro < ActiveRecord::Base
	belongs_to :user

	def electro_per_capita(current_user)
		electricity_kwst.to_i / current_user.profile.staff
	end	

	def electro_kwst_square_meters(current_user)
		electricity_kwst.to_i / (current_user.profile.building_size)
	end
end
