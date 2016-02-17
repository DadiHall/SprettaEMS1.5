class GarbagesController < ApplicationController
	before_action :set_garbage, only: [:edit, :update, :show, :destroy]
	before_action :garbage_owner, only: [ :edit, :update, :destroy]

		def index
			@garbages = current_user.garbages #(params[:user_id]) # líklegast til að sýna bara þann user sem er að skoða

		end

		def new
			@garbage = current_user.garbages.build
		end

		def create
			@garbage = current_user.garbages.build(garbage_params)

			if @garbage.save
				flash[:success] = "Messages sent."
				redirect_to garbage_path(@garbage)
			else
				flash[:danger] = "Error occured, message has not been sent."
				redirect_to new_garbage_path
			end		
		end

		def edit
		end

		def show

		end

		def update
			if @garbage.update(garbage_params)
			flash[:success] = "Line was successfully updated"
			redirect_to garbages_path(@garbage)
		else
			render 'edit'
		end		

	end

	def destroy
		@garbage.destroy
		flash[:danger] = "Line was successfully destroyed"
		redirect_to garbages_path
	end



		private

			def set_garbage
				@garbage = Garbage.find(params[:id])
			end

			def garbage_params
				params.require(:garbage).permit(:date, :trash_type, :trash_weight, :trash_cost, :user_id)
			end

			def garbage_owner
     			unless @garbage.user_id == current_user.id
      				flash[:notice] = 'Access denied as you are not owner of this Job'
      				redirect_to garbages_path
     			end
    		end
end