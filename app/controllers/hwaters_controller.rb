class HwatersController < ApplicationController

		before_action :set_hwater, only: [:edit, :update, :show, :destroy]
		before_action :hwater_owner, only: [ :edit, :update, :destroy]

		def index
			@hwaters = current_user.hwaters
		end

		def new
			@hwater = current_user.hwaters.build
		end

		def create
			@hwater = current_user.hwaters.build(hwater_params)

			if @hwater.save
				flash[:success] = "Messages sent."
				redirect_to hwater_path(@hwater)
			else
				flash[:danger] = "Error occured, message has not been sent."
				redirect_to new_hwater_path
			end		
		end

		def edit
		end

		def show

		end

		def update
			if @hwater.update(hwater_params)
			flash[:success] = "Line was successfully updated"
			redirect_to hwaters_path(@hwater)
		else
			render 'edit'
		end		

	end

	def destroy
		@hwater.destroy
		flash[:danger] = "Line was successfully destroyed"
		redirect_to hwaters_path
	end



		private

			def set_hwater
				@hwater = Hwater.find(params[:id])
			end

			def hwater_params
				params.require(:hwater).permit(:date, :building_name, :hot_water_cost, :hot_water_cubic_meter, :hot_water_m2_m3_ratio, :hot_water_m3_staff_ratio, :user_id)
			end

			def hwater_owner
     			unless @hwater.user_id == current_user.id
      				flash[:notice] = 'Access denied as you are not owner of this Job'
      				redirect_to hwaters_path
     			end
    		end
end