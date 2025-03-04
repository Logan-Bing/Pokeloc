# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

pokemon_one = Pokemon.create!(name: "Pikachu", user_id: 1)
pokemon_two = Pokemon.create!(name: "Bulbizarre", user_id: 1)
pokemon_three = Pokemon.create!(name: "Salameche", user_id: 1)
pokemon_four = Pokemon.create!(name: "Carapuce", user_id: 1)
pokemon_five = Pokemon.create!(name: "Mewtwo", user_id: 1)
