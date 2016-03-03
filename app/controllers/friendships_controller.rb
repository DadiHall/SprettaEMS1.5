class FriendshipsController < ApplicationController

	def create
		@friendship = current_user.friendships.build(:friend_id => params[:friend_id])
		if @friendship.save
			flash[:notice] = "Vinskap bætt við"
		redirect_to user_path(current_user)
	  else
	  		flash[:error] = "Gat ekki stofnað til vinskapar"
			redirect_to user_path(current_user)
	  end
	end

	
	def destroy
		@friendship = current_user.friendships.find(params[:id])
		@friendship.destroy
		flash[:notice] = "Vinskap eytt"
		redirect_to current_user # verður að breyta routing þegar búið er að laga allar síður Railscast #163
	
	end
end