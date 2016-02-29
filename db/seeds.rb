# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create! name: 'Spretta', email: 'spretta@spre.is', password: '12345678', password_confirmation: '12345678'

Paper.create! paper_type: 'Dagblaðapappír', paper_weight: '200', paper_cost: '1000', env_paper_weight: '0', user_id: '1'

Cleaning.create! cleaning_type: 'Ræstir', cleaning_liter: '20', cleaning_cost: '2500', user_id: '1'

User.Profile.create! user_id: '1', name: 'Spretta', address: 'SprettStreet', postalcode: '123', website: 'www.spretta.is', contact_person: 'Dadi', contact_email: 'dadi@spretta.is', phone_number: '34424242', buisness_type: 'Þjónusta', description: 'Best fucker', building_size: '105', staff: '10'

Electro.create! building_name: 'Sumarhöllin', electricity_kwst: '400', electricity_cost: '2020', user_id: '1'

Hwater.create! building_name: 'Sumarhöllin', hot_water_cost: '200', hot_water_cubic_meter: '198', user_id: '1'

Transport.create! transport_type: 'Leigubíll', transport_km: '120', transport_num_of_trips: '4', transport_km_recycled_fuel: '0', transport_flight_type: 'Innanlandsflug', transport_flight_km: '2000', user_id: '1'