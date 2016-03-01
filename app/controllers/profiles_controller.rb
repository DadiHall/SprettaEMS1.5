class ProfilesController < ApplicationController
	before_action :authenticate_user!

	before_action :only_current_user

	def new
		#form where a user can fill put their pwn profile.

		@user = User.find(params[:user_id]) # Finnur hver er userinn sem er loggaður inn, reaching in to the url and grabbs user.
		@profile = Profile.new
	
	end

	def create
		@user = User.find(params[:user_id])
		@profile = @user.build_profile(profile_params)

		#Lecture 159 User show action next :))))
		if @profile.save
			flash[:success] = "Profile updated"
			redirect_to root_path(params[:user_id]) #fer á user/show.html.erb
		else
			render action: :new

		end

	end

	def edit
		@user = User.find(params[:user_id])
		@profile = @user.profile

	end

	def update
		@user = User.find(params[:user_id])
		@profile = @user.profile


		if @profile.update_attributes(profile_params)
			flash[:success] = "Profile Updated!"
			redirect_to root_path(params[:user_id])
		else
			render action :edit
		end		
	end


	private

		def profile_params
			params.require(:profile).permit(:name, :staff, :address, :postalcode, :website, :contact_person, :contact_email, :phone_number, :buisness_type, :description, :building_size, :avatar)
		end

		def only_current_user

			@user = User.find(params[:user_id])
			redirect_to(root_url) unless @user == current_user
		end

end