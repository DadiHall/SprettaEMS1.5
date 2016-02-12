class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #before_action :authenticate_user!

  before_action :load_running_totals
  before_action :all_users_avarge

  def load_running_totals
    # method 1. Similar to how the calculation is done in the view.
    # @paper_weight_per_capita = Papers.all.map(&:paper_weight_per_capita, current_user).reduce(&:+)

    # method 2. does the summation in the database without having to load all the records into ruby. (weight needs to be a number in the db.)
    @paper_weight_per_capita = Paper.sum(:paper_weight) / current_user.staff

    @paper_tree_ratio = Paper.sum(:paper_weight) / 1000 
    # Rafmagnsreikningar
    @electro_total_per_capita = Electro.sum(:electricity_kwst) / current_user.staff

    @electro_total_per_m2 = Electro.sum(:electricity_kwst) / current_user.profile.building_size
  end

  def all_users_avarge
  		# hér eru meðaltöl ýmisa breyta sótt í gagnagrunninn og birt á forsíðu

  		@all_users_paper_average = Paper.average(:paper_weight)

  		@all_users_tree_average = Paper.average(:paper_weight) / 1000
  end

end
