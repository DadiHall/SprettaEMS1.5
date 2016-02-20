class Hwater < ActiveRecord::Base

	belongs_to :user


	def hot_water_m2_m3_ratio(current_user)
		hot_water_cubic_meter / (current_user.profile.building_size)
	end

	def hot_water_m3_staff_ratio(current_user)
		hot_water_cubic_meter / current_user.profile.staff
	end

end
