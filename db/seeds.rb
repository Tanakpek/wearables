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


marius = User.create!(email: "marius@hotmail.com", username: "Marius", password: "marius", admin: true)
mantas = User.create!(email: "mantas@hotmail.com", username: "Mantas", password: "mantas", admin: true)
tan = User.create!(email: "tan@hotmail.com", username: "Tan", password: "tantan", admin: true)

w1 = Wearable.new(address: "Carrer d'Escipió, 6, Barcelona", size: "M", user: marius, brand: "rolex", category: "watch", price: 150, description: "My 1st Rolex watch for rent now", title: "New Rolex watch")
w2 = Wearable.new(address: "Carrer d'Escipió, 90, Barcelona", size: "M", user: marius, brand: "levis", category: "jacket", price: 44, description: "My levis jacket", title: "New Levis jacket")
w3 = Wearable.new(address: "Plaça de Catalunya, Plaça de Catalunya, Barcelona", size: "M", user: mantas, brand: "patek philippe", category: "watch", price: 250, description: "A real patek philippe for you to rent", title: "Patek Philippe Watch")
w4 = Wearable.new(address: "Plaça Espanya, Barcelona", size: "M", user: mantas, brand: "polo", category: "jacket", price: 50, description: "Polo jacket for rent", title: "Awesome Polo Jacket")
w5 = Wearable.new(address: "Sant Cugat del Vallès", size: "M", user: tan, brand: "Audemars", category: "watch", price: 450, description: "Audemars my baby for rent for a cheap price", title: "Watch by Audemars")
w6 = Wearable.new(address: "Badalona Beach, Carrer de Ribas i Perdigó, Badalona", size: "M", user: tan, brand: "primarkt", category: "jacket", price: 10, description: "This is my description for my wearable", title: "Renting Primark jacket")

img_rolex = URI.open("http://res.cloudinary.com/mcgill-university/image/upload/v1661251560/e5flotdm4zzhxkn2wxzk.jpg")
img_rolex2 = URI.open("http://res.cloudinary.com/mcgill-university/image/upload/v1661252088/jx8qtvlc1xlgj2scxntp.jpg")
w1.photos.attach(io: img_rolex, filename: "nes.png", content_type: "image/png")
w1.photos.attach(io: img_rolex2, filename: "nes1.png", content_type: "image/png")
w1.save!

img_levis = URI.open("https://img01.ztat.net/article/spp-media-p1/84ea53c2043b3517ae1cc00a1d7ccd28/82f33face4044459b1dd647ab14b1bed.jpg?imwidth=762&filter=packshot&imformat=jpeg")
img_levis2 = URI.open("https://lsco.scene7.com/is/image/lsco/levis/clothing/723340130-front-pdp.jpg?$qv_desktop_full$")
w2.photos.attach(io: img_levis, filename: "levis1.png", content_type: "image/png")
w2.photos.attach(io: img_levis2, filename: "levis2.png", content_type: "image/png")
w2.save!

img_watch = URI.open("http://res.cloudinary.com/mcgill-university/image/upload/v1661256060/masq7bnynqbmffigxj7w.jpg")
w3.photos.attach(io: img_watch, filename: "watch1.png", content_type: "image/png")
w3.save!

img_polo = URI.open("http://res.cloudinary.com/mcgill-university/image/upload/v1661256170/dqv4lcsw4aee7rzkhhly.jpg")
w4.photos.attach(io: img_polo, filename: "polo.png", content_type: "image/png")
w4.save!

img_watch2 = URI.open("http://res.cloudinary.com/mcgill-university/image/upload/v1661256225/wfxsbgrimdwwwq459lr7.jpg")
w5.photos.attach(io: img_watch2, filename: "watch2.png", content_type: "image/png")
w5.save!

img_primark = URI.open("http://res.cloudinary.com/mcgill-university/image/upload/v1661256287/vynnzu0k38xomnezhyyf.jpg")
w6.photos.attach(io: img_primark, filename: "primark.png", content_type: "image/png")
w6.save!

Booking.create!(user: marius, wearable: w1, start_date: Date.today - 29, end_date: Date.today - 10, status: "unconfirmed")
Booking.create!(user: marius, wearable: w1, start_date: Date.today - 2, end_date: Date.today, status: "confirmed")
Booking.create!(user: marius, wearable: w2, start_date: Date.today - 2, end_date: Date.today, status: "confirmed")
Booking.create!(user: mantas, wearable: w3, start_date: Date.today - 5, end_date: Date.today, status: "confirmed")
Booking.create!(user: mantas, wearable: w4, start_date: Date.today + 10, end_date: Date.today + 20, status: "unconfirmed")
Booking.create!(user: tan, wearable: w5, start_date: Date.today + 10, end_date: Date.today + 21, status: "unconfirmed")
Booking.create!(user: tan, wearable: w6, start_date: Date.today + 6, end_date: Date.today + 8, status: "unconfirmed")
Booking.create!(user: tan, wearable: w6, start_date: Date.today + 14, end_date: Date.today + 16, status: "confirmed")
Booking.create!(user: tan, wearable: w6, start_date: Date.today + 30, end_date: Date.today + 50, status: "unconfirmed")
