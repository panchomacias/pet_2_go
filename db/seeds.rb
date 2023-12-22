# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'open-uri'
puts "Cleaning the database"
Booking.destroy_all
Offer.destroy_all
User.destroy_all
puts "Database cleaned"
# Usuarios

puts "Creating users"
francisco_macias = User.create!(
  name: "Francisco Macias",
  username: "panchomacias",
  email: "panchojmacias@gmail.com",
  address: "Arenales 3435, Buenos Aires",
  password: "123456"
)

ana_cabral = User.create!(
  name: "Ana Cabral",
  username: "anicabral",
  email: "cabralana18@gmail.com",
  address: "Baez 626, Buenos Aires",
  password: "123456"
)

sofia_alfaro = User.create!(
  name: "Sofia Alfaro",
  username: "sofiavapalfaro",
  email: "sofiavapalfaro98@gmail.com",
  address: "Av. Cabildo 1234, Buenos Aires",
  password: "123456"
)
puts "Users created successfully"

#Sitters
puts "Creating sitters"
offer1 = Offer.new(
  description: "Hola me llamo Francisco, un amante de los perrros, me compreto a cuidar tu perro",
  price: 30,
  name: francisco_macias.name,
  date_from: Date.today,
  date_to: "15/01/2024",
  user_id: francisco_macias.id
)
file1 = URI.open("https://www.lostiempos.com/sites/default/files/styles/noticia_detalle/public/media_imagen/2019/8/16/pag_7.jpg?itok=VFx29-BI")
offer1.photo.attach(io: file1, filename: 'paseador1.png', content_type: 'image/png')
offer1.save

offer2 = Offer.new(
  description: "Hola soy Ana, vivo para la compañia de los perros, me encanta cuidarlos y pasearlos",
  price: 40,
  name: ana_cabral.name,
  date_from: Date.today,
  date_to: "29/12/2023",
  user_id: ana_cabral.id
)
file2 = URI.open("https://i0.wp.com/www.elblogdeuma.com/wp-content/uploads/2022/12/Diseno-sin-titulo-2022-12-15T102227.781.jpg?ssl=1")
offer2.photo.attach(io: file2, filename: 'paseador2.png', content_type: 'image/png')
offer2.save

offer3 = Offer.new(
  description: "Hola! Mi nombre es Sofia, adoro a los perros, y me encantaria ser tu dog sitter de eleccion",
  price: 50,
  name: sofia_alfaro.name,
  date_from: Date.today,
  date_to: "30/01/2024",
  user_id: sofia_alfaro.id
)
file3 = URI.open("https://vidaysalud.com.ar/wp-content/uploads/2021/09/Nota-08-09.jpg")
offer3.photo.attach(io: file3, filename: 'paseador3.png', content_type: 'image/png')
offer3.save

puts "Sitters created successfully"

puts "Creating Bookings"

booking = Booking.create(
  status: true,
  user_id: sofia_alfaro.id,
  date_from: Date.today,
  date_to: Date.today + 2,
  offer_id: offer2.id
)
puts "Bookings created"
