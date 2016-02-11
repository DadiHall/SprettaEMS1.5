class ElectrosController < ApplicationController

	before_action :set_electro, only: [:edit, :update, :show, :destroy]
	
	def index
		@electros = Electro.all
	end

	def create

		@electro = current_user.electros.build(electro_params)



		if @electro.save
			flash[:success] = "Messages sent."
			redirect_to electros_path(@electro)
		else
			flash[:danger] = "Error occured, message has not been sent."
			redirect_to new_electros_path
		end		

	end

	def new 
		@electro = current_user.electros.build

	end

	def edit

	end

	def show

	end

	def update
		if @electro.update(electricity_params)
			flash[:success] = "Line was successfully updated"
			redirect_to electros_path(@electro)
		else
			render 'edit'
		end		

	end

	def destroy
		@electro.destroy
		flash[:danger] = "Line was successfully destroyed"
		redirect_to electros_path

	end

		private
		

			def set_electro
				@electro = Electro.find(params[:id])	
			end

			def electro_params
				params.require(:electro).permit(:date, :building_name, :electricity_kwst, :electricity_cost, :kwst_staff_ratio, :kwst_square_meter_ratio, :user_id)
			end	
end