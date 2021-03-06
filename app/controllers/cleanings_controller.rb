class CleaningsController < ApplicationController
	before_action :set_cleaning, only: [:edit, :update, :show, :destroy]
	before_action :cleaning_owner, only: [ :edit, :update, :destroy]
	
	def index
		@cleanings = current_user.cleanings
	end

	def create

		@cleaning = current_user.cleanings.build(cleaning_params)



		if @cleaning.save
			flash[:success] = "Messages sent."
			redirect_to cleanings_path(@cleaning)
		else
			flash[:danger] = "Error occured, message has not been sent."
			redirect_to new_cleanings_path
		end		

	end

	def new
		@cleaning = current_user.cleanings.build

	end

	def edit

	end

	def show

	end

	def update
		if @cleaning.update(cleaning_params)
			flash[:success] = "Line was successfully updated"
			redirect_to cleanings_path(@cleaning)
		else
			render 'edit'
		end		

	end

	def destroy
		@cleaning.destroy
		flash[:danger] = "Line was successfully destroyed"
		redirect_to cleanings_path

	end

		private
		

			def set_cleaning
				@cleaning = Cleaning.find(params[:id])	
			end

			def cleaning_params
				params.require(:cleaning).permit(:cleaning_type, :date, :cleaning_liter, :cleaning_cost, :env_clean_ratio, :user_id)
			end	
                      
    		def cleaning_owner
     			unless @cleaning.user_id == current_user.id
      				flash[:notice] = 'Access denied as you are not owner of this Job'
      				redirect_to cleanings_path
     			end
    		end
end