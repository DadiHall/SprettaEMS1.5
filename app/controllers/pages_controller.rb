class PagesController < ApplicationController


	def index
		@users = User.all
	end

	def about

	end

	def gb_index
	end

	def user_total
		@user = User.find(params[:id])
	end
end