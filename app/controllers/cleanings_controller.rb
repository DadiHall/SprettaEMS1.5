class CleaningsController < ApplicationController
	before_action :set_cleaning, only: [:edit, :update, :show, :destroy]
	
	def index

	end

	def create
		@cleaning = Cleaning.new(cleaning_params)

		if @cleaning.save
			flash[:success] = "Messages sent."
			redirect_to cleanings_path(@paper)
		else
			flash[:danger] = "Error occured, message has not been sent."
			redirect_to new_cleanings_path
		end		

	end

	def new
		@cleaning = Cleaning.new

	end

	def edit

	end

	def show

	end

	def update

	end

	def destroy

	end

		private
		

			def set_cleaning
				@cleaning = Cleaning.find(params[:id])	
			end

			def cleaning_params
				params.require(:cleaning).permit(:cleaning_type, :date, :cleaning_liter, :cleaning_cost, :env_cleaning_ratio, :user_id)
			end	
end