class TransportsController < ApplicationController
	before_action :set_transport, only: [:edit, :update, :show, :destroy]
	before_action :transport_owner, only: [ :edit, :update, :destroy]

		def index
			@transports = current_user.transports #(params[:user_id]) # líklegast til að sýna bara þann user sem er að skoða

		end

		def new
			@transport = current_user.transports.build
		end

		def create
			@transport = current_user.transports.build(transport_params)

			if @transport.save
				flash[:success] = "Messages sent."
				redirect_to transport_path(@transport)
			else
				flash[:danger] = "Error occured, message has not been sent."
				redirect_to new_transport_path
			end		
		end

		def edit
		end

		def show

		end

		def update
			if @transport.update(transport_params)
			flash[:success] = "Line was successfully updated"
			redirect_to transports_path(@transport)
		else
			render 'edit'
		end		

	end

	def destroy
		@transport.destroy
		flash[:danger] = "Line was successfully destroyed"
		redirect_to transports_path
	end



		private

			def set_transport
				@transport = Transport.find(params[:id])
			end

			def transport_params
				params.require(:transport).permit(:date, :transport_type, :transport_km, :transport_num_of_trips, :transport_km_recycled_fuel, :transport_co2, :transport_flight_type, :transport_flight_km, :user_id)
			end

			def transport_owner
     			unless @transport.user_id == current_user.id
      				flash[:notice] = 'Access denied as you are not owner of this Job'
      				redirect_to transports_path
     			end
    		end
end