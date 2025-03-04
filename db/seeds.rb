# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"

puts "destroy all pokemons"
Pokemon.destroy_all
puts "pokemons destroyed"

puts "create new pokemons"
pokemon_one = Pokemon.create!(name: "Pikachu", address: "bourg palette", price: "160 $", user_id: 1)
#photo1 = File.open -> ta photo
image_url = Cloudinary::Utils.cloudinary_url('qjhqz8nihs2eyyzdnppq')
photo1 = URI.parse(image_url).open
pokemon_one.photo.attach(io: photo1, filename: "pikachu.jpg", content_type: "image/jpg")
pokemon_one.save
#Pour afficher la photo dans ta vue : image_tag(pokemon.photo)
pokemon_two = Pokemon.create!(name: "Bulbizarre", address: "bourg palette", price: "180 $", user_id: 1)
image_url_two = Cloudinary::Utils.cloudinary_url('rjvycv9hy2tncctvbjwd')
photo2 = URI.parse(image_url_two).open
pokemon_two.photo.attach(io: photo2, filename: "bulbizarre.jpg", content_type: "image/jpg")
pokemon_two.save

pokemon_three = Pokemon.create!(name: "Salameche", address: "bourg palette", price: "200 $", user_id: 1)
image_url_three = Cloudinary::Utils.cloudinary_url('j1cexxut34o88uanmgmh')
photo3 = URI.parse(image_url_three).open
pokemon_three.photo.attach(io: photo3, filename: "salamèche.jpeg", content_type: "image/jpeg")
pokemon_three.save

pokemon_four = Pokemon.create!(name: "Carapuce", address: "bourg palette", price: "160 $", user_id: 1)
image_url_four = Cloudinary::Utils.cloudinary_url('qzuh9vqcik77mrbdlxw7')
photo4 = URI.parse(image_url_four).open
pokemon_four.photo.attach(io: photo4, filename: "carapuce.jpg", content_type: "image/jpg")
pokemon_four.save

pokemon_five = Pokemon.create!(name: "Mewtwo", address: "bourg palette", price: "160 $", user_id: 1)
image_url_five = Cloudinary::Utils.cloudinary_url('oux7eojnzvstdri5w6nv')
photo5 = URI.parse(image_url_five).open
pokemon_five.photo.attach(io: photo5, filename: "mewtwo.jpg", content_type: "image/jpg")
pokemon_five.save
puts "pokemons created"
