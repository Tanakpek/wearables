# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Review.destroy_all
Booking.destroy_all
Wearable.destroy_all
User.destroy_all

marius = User.create!(email: "marius@hotmail.com", username: "Marius", password: "marius", admin: true)
mantas = User.create!(email: "mantas@hotmail.com", username: "Mantas", password: "mantas", admin: true)
tan = User.create!(email: "tan@hotmail.com", username: "Tan", password: "tantan", admin: true)


m1 = Money.new(5,"EUR")


w1 = Wearable.new(address: "Carrer d'Escipió, 6, Barcelona", size: "M", user: marius, brand: "rolex", category: "watch", price: 5, description: "My 1st Rolex watch for rent now, I got it from my grandfather and have tremendous attachement to it, so please don't loose it and take care. Also, wearing a Rolex is super cool, thus, rent it directly to look cool", title: "New Rolex watch")
w2 = Wearable.new(address: "Carrer d'Escipió, 90, Barcelona", size: "M", user: marius, brand: "levis", category: "jacket", price: 21, description: "My levis jacket", title: "New Levis jacket")
w3 = Wearable.new(address: "Plaça de Catalunya, Plaça de Catalunya, Barcelona", size: "M", user: mantas, brand: "patek philippe", category: "watch", price: 35, description: "A real patek philippe for you to rent", title: "Patek Philippe Watch")
w4 = Wearable.new(address: "Plaça Espanya, Barcelona", size: "M", user: mantas, brand: "polo", category: "jacket", price: 50 , description: "Polo jacket for rent", title: "Awesome Polo Jacket")
w5 = Wearable.new(address: "Sant Cugat del Vallès", size: "M", user: tan, brand: "Audemars", category: "watch", price: 12, description: "Audemars my baby for rent for a cheap price", title: "Watch by Audemars")
w6 = Wearable.new(address: "Carrer de Ribas i Perdigó, Badalona", size: "M", user: tan, brand: "primarkt", category: "jacket", price: 0.50, description: "This is my description for my wearable", title: "Renting Primark jacket")
w7 = Wearable.new(address: "Gracia, Badalona", size: "M", user: tan, brand: "Google", category: "watch", price: 20, description: "Google watch", title: "Google watch")
w8 = Wearable.new(address: "C/ D'Emília Llorca Martín, 22, 08003 Barcelona", size: "S", user: tan, brand: "Ray Ban", category: "glasses", price: 8, description: "Ray Ban glasses", title: "Ray Ban glasses")
w9 = Wearable.new(address: "La Sagrera, Barcelona", size: "S", user: tan, brand: "Oakley", category: "glasses", price: 12, description: "Oakley", title: "Oakley")


sid = Stripe::Product.create({name: w1.title})
sid = sid.to_s
sid = JSON.parse(sid)
w1.stripe_id = sid["id"]


sid = Stripe::Product.create({name: w2.title})
sid = sid.to_s
sid = JSON.parse(sid)
w2.stripe_id = sid["id"]


sid = Stripe::Product.create({name: w3.title})
sid = sid.to_s
sid = JSON.parse(sid)
w3.stripe_id = sid["id"]


sid = Stripe::Product.create({name: w4.title})
sid = sid.to_s
sid = JSON.parse(sid)
w4.stripe_id = sid["id"]


sid = Stripe::Product.create({name: w5.title})
sid = sid.to_s
sid = JSON.parse(sid)
w5.stripe_id = sid["id"]


sid = Stripe::Product.create({name: w6.title})
sid = sid.to_s
sid = JSON.parse(sid)
w6.stripe_id = sid["id"]


img_watch = URI.open("http://res.cloudinary.com/mcgill-university/image/upload/v1661517576/m2khublqibypet7doxik.jpg")
w9.photos.attach(io: img_watch, filename: "watch9.png", content_type: "image/png")
w9.save!

img_rolex = URI.open("http://res.cloudinary.com/mcgill-university/image/upload/v1661516856/mohw9luel3ry2vjf06eg.jpg")
img_rolex3 = URI.open("http://res.cloudinary.com/mcgill-university/image/upload/v1661251560/e5flotdm4zzhxkn2wxzk.jpg")
img_rolex2 = URI.open("http://res.cloudinary.com/mcgill-university/image/upload/v1661252088/jx8qtvlc1xlgj2scxntp.jpg")
w1.photos.attach(io: img_rolex, filename: "nes.png", content_type: "image/png")
w1.photos.attach(io: img_rolex2, filename: "nes1.png", content_type: "image/png")
w1.photos.attach(io: img_rolex3, filename: "nes2.png", content_type: "image/png")
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

img_g1 = URI.open("http://res.cloudinary.com/mcgill-university/image/upload/v1661517057/eu0q2u8uny1ge7pzi2ud.webp")
w7.photos.attach(io: img_g1, filename: "g.png", content_type: "image/png")
w7.save!

img_dog = URI.open("http://res.cloudinary.com/mcgill-university/image/upload/v1661517334/hw02sbzldx6mvptbnpas.jpg")
w8.photos.attach(io: img_dog, filename: "dog.png", content_type: "image/png")
w8.save!

b1 = Booking.create!(user: marius, wearable: w5, start_date: Date.today - 29, end_date: Date.today - 10, status: "unconfirmed")
b2 = Booking.create!(user: marius, wearable: w6, start_date: Date.today - 2, end_date: Date.today, status: "confirmed")
b3 = Booking.create!(user: marius, wearable: w3, start_date: Date.today - 2, end_date: Date.today, status: "confirmed")
b4 = Booking.create!(user: mantas, wearable: w5, start_date: Date.today - 5, end_date: Date.today, status: "confirmed")
b5 = Booking.create!(user: mantas, wearable: w4, start_date: Date.today + 10, end_date: Date.today + 20, status: "unconfirmed")
b6 = Booking.create!(user: tan, wearable: w1, start_date: Date.today + 10, end_date: Date.today + 21, status: "unconfirmed")
b7 = Booking.create!(user: tan, wearable: w3, start_date: Date.today + 6, end_date: Date.today + 8, status: "unconfirmed")
b8 = Booking.create!(user: tan, wearable: w4, start_date: Date.today + 14, end_date: Date.today + 16, status: "confirmed")
b9 = Booking.create!(user: tan, wearable: w5, start_date: Date.today + 30, end_date: Date.today + 50, status: "unconfirmed")

def add_reviews(booking)
Review.create(booking: booking, content: "Man this watch was great and what a lovely person was Marius", rating: 5)
Review.create(booking: booking, content: "Great stuff, thanks!", rating: 4)
Review.create(booking: booking, content: "Just fabulous :))))", rating: 5)
Review.create(booking: booking, content: "Very honest and great transaction", rating: 4)
end

add_reviews(b1)
add_reviews(b3)
add_reviews(b4)
add_reviews(b5)
add_reviews(b6)
add_reviews(b7)
