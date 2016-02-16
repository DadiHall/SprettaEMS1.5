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
    #PAppir og Tre
   if signed_in?  then @paper_weight_per_capita = Paper.sum(:paper_weight) / current_user.profile.staff end

    @paper_tree_ratio = Paper.sum(:paper_weight) / 1000 
    # Rafmagnsreikningar
    if signed_in? then @electro_total_per_capita = Electro.sum(:electricity_kwst) / current_user.profile.staff end

    if signed_in? then @electro_total_per_m2 = Electro.sum(:electricity_kwst) / current_user.profile.building_size end

      #Heitt vatn
     if signed_in? then @hwater_total_m3_per_capita = Hwater.sum(:hot_water_cubic_meter) /current_user.profile.staff end 

      if signed_in? then @hwater_m3_m2_ratio = Hwater.sum(:hot_water_cubic_meter) / current_user.profile.building_size end

  end


  def all_users_avarge
  		# hér eru meðaltöl ýmisa breyta sótt í gagnagrunninn og birt á forsíðu

  		@all_users_paper_average = Paper.average(:paper_weight) / User.count

  		@all_users_tree_average = Paper.average(:paper_weight) / 1000

      @all_users_power_average = Electro.average(:electricity_kwst) / User.count

      @all_users_hwater_average = Hwater.average(:hot_water_cubic_meter) / User.count
  end

end
