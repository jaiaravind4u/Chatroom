# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p "===== Seeding users ====="
 users = [
     {first_name: "Severus", last_name: "Snape", email: "severus32snape@gmail.com", password: "password", password_confirmation: "password"},
     {first_name: "Jai", last_name: "Aravind", email: "jaiaravind4u@gmail.com", password: "password", password_confirmation: "password"},
     {first_name: "Vignesh", last_name: "", email: "vignesh2677@gmail.com", password: "password", password_confirmation: "password"},
     {first_name: "Pranav", last_name: "Sricharan", email: "pranav.sricharan@gmail.com", password: "password", password_confirmation: "password"},
 ]

 users.each do |user|
    User.create(user)
 end

 current_user = User.create(first_name: "Prassy24", admin: true, email: "prasana24n97@gmail.com", password: "password", password_confirmation: "password")
 p "===== Seeded users ======"

 p "===== Seeding chatareas ====="
 chatareas = [
     {name: "MSc 2020"}, {name: "SLN Fam"}, {name: "12-A"}, {name: "Flutter"}, {name: "MTechViral"},
     {name: "Finally"}, {name: "GeeksDay"}, {name: "MovieTalkies"}, {name: "StarSports"}, {name: "TripTime"},
]
chatareas.each {|chatarea| Chatarea.create(chatarea) }
p "===== Seeded chatareas ====="

