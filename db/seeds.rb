# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
	Datum.create(devise: 'anne', 
		PM2_5: rand(10).to_s,
		PM10: rand(10).to_s, 
		positive_feeling: 1, 
		mixed_feeling: 0,
		negative_feeling: 0,
		longitude: "46.1",
		latitude: "3.2")
end

10.times do
	Datum.create(devise: 'remy', 
		PM2_5: rand(10).to_s,
		PM10: rand(10).to_s, 
		positive_feeling: 1, 
		mixed_feeling: 0,
		negative_feeling: 0,
		longitude: "46.1",
		latitude: "3.2")
end


