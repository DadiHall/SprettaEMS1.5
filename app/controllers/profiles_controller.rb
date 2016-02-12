class ProfilesController < ApplicationController

	def new
		#form where a user can fill put their pwn profile.

		@user = User.find(params[:user_id]) # Finnur hver er userinn sem er loggaður inn, reaching in to the url and grabbs user.
		@profile = @user.build_profile
	end

	def create
		@user = User.find(params[:user_id])
		@profile = @user.build_profile(profile_params)
<<<<<<< HEAD

		if @profile.save
			flash[:success] = "Profile updated"
			redirect_to user_path(params[:user_id])
		else
			render action: :new

		end
=======
>>>>>>> AddUserProfile
	end


	private

		def profile_params
			params.require(:profile).permit(:name, :address, :postalcode, :website, :contact_person, :contact_email, :phone_number, :buisness_type, :description)
		end

end