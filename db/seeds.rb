# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Group.create!(name: "Axies")
Place.create!(name: "Maadi", latitude: "29.959236", longitude: "31.2248074")
Place.create!(name: "New-Cairo", latitude: "30.959236", longitude: "40.2248074")
Place.create!(name: "Zamalek,", latitude: "30.959236", longitude: "40.2248074")
Place.create!(name: "Smart Village", latitude: "30.959236", longitude: "40.2248074")
User.create!(first_name: "Abdulalh", last_name:"Medhat", phone_number: "01129444002", group_id: 1, home_place_id: 1, work_place_id: 2)
User.create!(first_name: "User1", last_name:"One", phone_number: "01129444002", group_id: 1, home_place_id: 2, work_place_id: 3)
User.create!(first_name: "User2", last_name:"two", phone_number: "01129444002", group_id: 1, home_place_id: 4, work_place_id: 1)
Trip.create!(departure_time: "2016/12:00PM", source_id: 2, destination_id: 1, seats: 3, driver_id: 1)
