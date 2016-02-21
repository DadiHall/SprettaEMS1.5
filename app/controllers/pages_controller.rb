class PagesController < ApplicationController


	def index
		@users = User.all
	end

	def about

	end

	def gb_index
	end
end