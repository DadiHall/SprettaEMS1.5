class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #before_action :authenticate_user!

  before_action :load_running_totals, :if => :signed_in? 
 
  before_action :all_users_avarge

  def load_running_totals
    # method 1. Similar to how the calculation is done in the view.
    # @paper_weight_per_capita = Papers.all.map(&:paper_weight_per_capita, current_user).reduce(&:+)

    # method 2. does the summation in the database without having to load all the records into ruby. (weight needs to be a number in the db.)
    #PAppir og Tre
   unless current_user.profile.blank? 
        #Pappírinn
           @paper_weight_per_capita = current_user.papers.sum(:paper_weight) / (current_user.profile.staff) 
        #Rafmagn   
           @electro_total_per_capita = current_user.electros.sum(:electricity_kwst) / current_user.profile.staff 
           @electro_total_per_m2 = current_user.electros.sum(:electricity_kwst) / current_user.profile.building_size
        #HotWater    
           @hwater_total_m3_per_capita = current_user.hwaters.sum(:hot_water_cubic_meter) /current_user.profile.staff
           @hwater_m3_m2_ratio = current_user.hwaters.sum(:hot_water_cubic_meter) / current_user.profile.building_size
        #Ræsting   
           @cleaning_staff_ratio = current_user.cleanings.sum(:cleaning_liter).to_i / current_user.profile.staff
           @cleaning_building_ratio = current_user.cleanings.sum(:cleaning_liter) / current_user.profile.building_size
        #Ferðalog-bilar
           @transport_co2_km = current_user.transports.sum(:transport_km) * (0.1404)
           @transport_co2_km_staff_ratio = current_user.transports.sum(:transport_km) * (0.1404) / current_user.profile.staff
           @transport_km_staff_ratio = current_user.transports.sum(:transport_km) / current_user.profile.staff
           @transport_km = current_user.transports.sum(:transport_km)
        #Ferðalog-flug
          @transport_flight_co2 = current_user.transports.sum(:transport_flight_km).to_i * (0.1722)   
          @transport_flight_co2_staff_ratio = current_user.transports.sum(:transport_flight_km).to_i * (0.1722) / current_user.profile.staff
          @transport_flight_km = current_user.transports.sum(:transport_flight_km).to_i 
          @transport_flight_km_staff_ratio = current_user.transports.sum(:transport_flight_km).to_i / current_user.profile.staff

    else 
      flash[:notice] = "No profile exists for current user"
      redirect_to new_user_profile_path(current_user) if current_user and return
   end
 

    @paper_tree_ratio = current_user.papers.sum(:paper_weight) / 1000 

    # Rafmagnsreikningar
    #unless current_user.profile.blank?  
      #@electro_total_per_capita = Electro.sum(:electricity_kwst) / current_user.profile.staff 
    #else
       #flash[:notice] = "No profile exists for current user"
        
    #end

    #if signed_in? then @electro_total_per_m2 = Electro.sum(:electricity_kwst) / current_user.profile.building_size end

      #Heitt vatn
     #if signed_in? then @hwater_total_m3_per_capita = Hwater.sum(:hot_water_cubic_meter) /current_user.profile.staff end 

     # if signed_in? then @hwater_m3_m2_ratio = Hwater.sum(:hot_water_cubic_meter) / current_user.profile.building_size end

  end


  def all_users_avarge
  		# hér eru meðaltöl ýmisa breyta sótt í gagnagrunninn og birt á forsíðu

  		@all_users_paper_average = Paper.average(:paper_weight) / User.count

  		@all_users_tree_average = Paper.average(:paper_weight) / 1000

      @all_users_power_average = Electro.average(:electricity_kwst) / User.count

      @all_users_hwater_average = Hwater.average(:hot_water_cubic_meter) / User.count
  end

end
