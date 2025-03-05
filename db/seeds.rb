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
image_url = Cloudinary::Utils.cloudinary_url('xvtpbsfqnvddkdbpdeeh')
photo1 = URI.parse(image_url).open
pokemon_one.photo.attach(io: photo1, filename: "pikachu.jpg", content_type: "image/jpg")
pokemon_one.save

puts "Pikachu created"

#Pour afficher la photo dans ta vue : image_tag(pokemon.photo)
pokemon_two = Pokemon.create!(name: "Bulbizarre", address: "bourg palette", price: "180 $", user_id: 1)
image_url_two = Cloudinary::Utils.cloudinary_url('kxnxnnc3lksean4pnhqg')
photo2 = URI.parse(image_url_two).open
pokemon_two.photo.attach(io: photo2, filename: "bulbizarre.jpg", content_type: "image/jpg")
pokemon_two.save

puts "Bulbizarre created"

pokemon_three = Pokemon.create!(name: "Salameche", address: "bourg palette", price: "200 $", user_id: 1)
image_url_three = Cloudinary::Utils.cloudinary_url('cp8msqybbactbg1hs59e')
photo3 = URI.parse(image_url_three).open
pokemon_three.photo.attach(io: photo3, filename: "salamèche.jpeg", content_type: "image/jpeg")
pokemon_three.save

puts "Salameche created"
pokemon_four = Pokemon.create!(name: "Carapuce", address: "bourg palette", price: "160 $", user_id: 1)
image_url_four = Cloudinary::Utils.cloudinary_url('vlkxryp8g6muyniawoma')
photo4 = URI.parse(image_url_four).open
pokemon_four.photo.attach(io: photo4, filename: "carapuce.jpg", content_type: "image/jpg")
pokemon_four.save

puts "Carapuce created"
pokemon_five = Pokemon.create!(name: "Mewtwo", address: "bourg palette", price: "160 $", user_id: 1)
image_url_five = Cloudinary::Utils.cloudinary_url('yacllekk4qzrl97ty8yg')
photo5 = URI.parse(image_url_five).open
pokemon_five.photo.attach(io: photo5, filename: "mewtwo.jpg", content_type: "image/jpg")
pokemon_five.save
puts "Mewtwo created"

pokemon_six = Pokemon.create!(name: "Rondoudou", address: "bourg palette", price: "160 $", user_id: 1)
image_url_six = Cloudinary::Utils.cloudinary_url('gnle7xx86ybwlrnvi9gc')
photo6 = URI.parse(image_url_six).open
pokemon_six.photo.attach(io: photo6, filename: "rondoudou.jpg", content_type: "image/jpg")
pokemon_six.save
puts "Rondoudou created"

pokemon_seven = Pokemon.create!(name: "Dracaufeu", address: "bourg palette", price: "160 $", user_id: 1)
image_url_seven = Cloudinary::Utils.cloudinary_url('hh10qcyjb66of70bwykl')
photo7 = URI.parse(image_url_seven).open
pokemon_seven.photo.attach(io: photo7, filename: "dracaufeu.jpg", content_type: "image/jpg")
pokemon_seven.save
puts "Dracaufeu created"

pokemon_eight = Pokemon.create!(name: "Excelangue", address: "bourg palette", price: "160 $", user_id: 1)
image_url_eight = Cloudinary::Utils.cloudinary_url('suhzn8itmkxrdsdthmst')
photo8 = URI.parse(image_url_eight).open
pokemon_eight.photo.attach(io: photo8, filename: "excelangue.jpg", content_type: "image/jpg")
pokemon_eight.save
puts "Excelangue created"

pokemon_nine = Pokemon.create!(name: "Mrmime", address: "bourg palette", price: "160 $", user_id: 1)
image_url_nine = Cloudinary::Utils.cloudinary_url('zhr8tqsshm54xsceboas')
photo9 = URI.parse(image_url_nine).open
pokemon_nine.photo.attach(io: photo9, filename: "mrmime.jpg", content_type: "image/jpg")
pokemon_nine.save
puts "MrMime created"

pokemon_ten = Pokemon.create!(name: "Capumain", address: "bourg palette", price: "160 $", user_id: 1)
image_url_ten = Cloudinary::Utils.cloudinary_url('fbhta4wsbz9q9i2ujhl7')
photo10 = URI.parse(image_url_ten).open
pokemon_ten.photo.attach(io: photo10, filename: "capumain.jpg", content_type: "image/jpg")
pokemon_ten.save
puts "Capumain created"

pokemon_eleven = Pokemon.create!(name: "Ludicolo", address: "bourg palette", price: "160 $", user_id: 1)
image_url_eleven = Cloudinary::Utils.cloudinary_url('qgcluotbwvuvatcztmmo')
photo11 = URI.parse(image_url_eleven).open
pokemon_eleven.photo.attach(io: photo11, filename: "ludicolo.jpg", content_type: "image/jpg")
pokemon_eleven.save
puts "Ludicolo created"

pokemon_twelve = Pokemon.create!(name: "Pskykokwak", address: "bourg palette", price: "160 $", user_id: 1)
image_url_twelve = Cloudinary::Utils.cloudinary_url('oi8nsfvhvbjycigqlft2')
photo12 = URI.parse(image_url_twelve).open
pokemon_twelve.photo.attach(io: photo12, filename: "pskykokwak.jpg", content_type: "image/jpg")
pokemon_twelve.save
puts "Psykokwak created"

pokemon_thirteen = Pokemon.create!(name: "Ronflex", address: "bourg palette", price: "160 $", user_id: 1)
image_url_thirteen = Cloudinary::Utils.cloudinary_url('trdjl2sdg47fwghpekmi')
photo13 = URI.parse(image_url_thirteen).open
pokemon_thirteen.photo.attach(io: photo13, filename: "ronflex.jpg", content_type: "image/jpg")
pokemon_thirteen.save
puts "Ronflex created"

pokemon_fourteen = Pokemon.create!(name: "Pikachu", address: "Foret de Jade", price: "160 $", user_id: 1)
image_url_fourteen = Cloudinary::Utils.cloudinary_url('pt1oom7vagd3vpde3nyg')
photo14 = URI.parse(image_url_fourteen).open
pokemon_fourteen.photo.attach(io: photo14, filename: "pikachu2.jpg", content_type: "image/jpg")
pokemon_fourteen.save
puts "Pikachu created"

puts "Done ! #{Pokemon.count} Pokemons created"
