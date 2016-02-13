class Transport < ActiveRecord::Base
	belongs_to :user

	def transport_co2_per_km
		transport_km * (0.1404)
	end

	def transport_km_staff_ratio(current_user)
		transport_km / current_user.staff
	end

	def transport_co2_staff_ratio(current_user)
		(transport_km * (0.1404)) / current_user.staff
	end

	def transport_flight_co2_per_km
		transport_flight_km.to_f * (0.1722) # Miðað við að 1 passenger mile sé 1,602 km: smkv. carbonfund.org er 1 pm = 0.185 - 0.277 kg c02
	end

	def transport_flight_co2_staff_ratio(current_user)
		(transport_flight_km.to_f * (0.1722)) / current_user.staff
	end

	def transport_flight_km_staff_ratio(current_user)
		transport_flight_km / current_user.staff
	end
end
