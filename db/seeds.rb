# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Booking.destroy_all
Wearable.destroy_all
User.destroy_all


marius = User.create!(email: "marius@hotmail.com", username: "Marius", password: "marius")
mantas = User.create!(email: "mantas@hotmail.com", username: "Mantas", password: "mantas")
tan = User.create!(email: "tan@hotmail.com", username: "Tan", password: "tantan")

w1 = Wearable.create!(user: marius, brand: "rolex", category: "watch", price: 150, description: "My 1st Rolex watch for rent now", title: "Rolex for rent")
w2 = Wearable.create!(user: marius, brand: "levis", category: "jacket", price: 44, description: "My levis jacket", title: "New Levis jacket")
w3 = Wearable.create!(user: mantas, brand: "patek philippe", category: "watch", price: 250, description: "A real patek philippe for you to rent", title: "patek philippe now")
w4 = Wearable.create!(user: mantas, brand: "polo", category: "jacket", price: 50, description: "Polo jacket for rent", title: "Polo polo polo")
w5 = Wearable.create!(user: tan, brand: "Audemars", category: "watch", price: 450, description: "Audemars my baby for rent for a cheap price", title: "Audemars here!")
w6 = Wearable.create!(user: tan, brand: "primarkt", category: "jacket", price: 10, description: "This is my description for my wearable", title: "Renting primark jacket")

Booking.create!(user: marius, wearable: w1, start_date: Date.today - 29, end_date: Date.today - 10, status: "unconfirmed")
Booking.create!(user: marius, wearable: w1, start_date: Date.today - 2, end_date: Date.today, status: "confirmed")
Booking.create!(user: marius, wearable: w2, start_date: Date.today - 2, end_date: Date.today, status: "confirmed")
Booking.create!(user: mantas, wearable: w3, start_date: Date.today - 5, end_date: Date.today, status: "confirmed")
Booking.create!(user: mantas, wearable: w4, start_date: Date.today + 10, end_date: Date.today + 20, status: "unconfirmed")
Booking.create!(user: tan, wearable: w5, start_date: Date.today + 10, end_date: Date.today + 21, status: "unconfirmed")
Booking.create!(user: tan, wearable: w6, start_date: Date.today + 6, end_date: Date.today + 8, status: "unconfirmed")
Booking.create!(user: tan, wearable: w6, start_date: Date.today + 14, end_date: Date.today + 16, status: "confirmed")
Booking.create!(user: tan, wearable: w6, start_date: Date.today + 30, end_date: Date.today + 50, status: "unconfirmed")
