class AddonsController < ApplicationController
	before_action :set_addon, only: [:edit, :update, :show, :destroy]
	

		def index
			@addons = current_user.addons #(params[:user_id]) # líklegast til að sýna bara þann user sem er að skoða

		end

		def new
			@addon = current_user.addons.build
		end

		def create
			@addon = current_user.addons.build(addon_params)

			if @addon.save
				flash[:success] = "Messages sent."
				redirect_to user_path(@addon)
			else
				flash[:danger] = "Error occured, message has not been sent."
				redirect_to new_addon_path
			end		
		end

		def edit
		end

		def show

		end

		def update
			if @addon.update(transport_params)
			flash[:success] = "Line was successfully updated"
			redirect_to transports_path(@addon)
		else
			render 'edit'
		end		

	end

	def destroy
		@addon.destroy
		flash[:danger] = "Line was successfully destroyed"
		redirect_to addons_path
	end



		private

			def set_addon
				@addon = Addon.find(params[:id])
			end

			def addon_params
				params.require(:addon).permit(:addon_1, :addon_2, :addon_3, :addon_4)
			end

			
end
