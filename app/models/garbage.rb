class Garbage < ActiveRecord::Base
	belongs_to :user

	def total_trash
		Garbage.sum(:trash_weight)
		
	end

	def trash_weight_ratio
		 ( trash_weight / total_trash) *100
	end

	def trash_user_ratio(current_user)
		trash_weight / current_user.staff
	end
end
