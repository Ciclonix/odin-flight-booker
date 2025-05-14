# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

["NYC", "VIC", "AZX", "KGA"].each do |code|
  Airport.find_or_create_by!(code: code)
end

[[Airport.first.id, Airport.last.id, "2011-05-19 10:30:14", "100"]].each do |dep, arr, start, length|
  Flight.find_or_create_by!(departure_airport_id: dep, arrival_airport_id: arr, departure_time: start, duration: length)
end