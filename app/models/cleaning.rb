class Cleaning < ActiveRecord::Base

	belongs_to :user

	def cleaning_liter_per_capita(current_user)
    	cleaning_liter.to_i / current_user.profile.staff
  	end

  	def cleaning_liter_env_ratio
    	(( env_clean_ratio.to_f / cleaning_liter.to_f)* 100)
  	end

  	def cleaning_cost_per_capita(current_user)
  		cleaning_cost.to_i / current_user.profile.staff
  	end	
  	
end