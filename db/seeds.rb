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

[
  [Airport.find_by(code: "NYC").id, Airport.find_by(code: "NYC").id, "2028-03-14 10:30:00", "100"],
  [Airport.find_by(code: "NYC").id, Airport.find_by(code: "KGA").id, "2026-11-16 12:00:05", "350"],
  [Airport.find_by(code: "NYC").id, Airport.find_by(code: "VIC").id, "2024-06-21 12:00:05", "250"],
  [Airport.find_by(code: "NYC").id, Airport.find_by(code: "VIC").id, "2028-03-14 12:00:05", "250"],
  [Airport.find_by(code: "NYC").id, Airport.find_by(code: "AZX").id, "2030-01-10 12:00:05", "300"],
  [Airport.find_by(code: "KGA").id, Airport.find_by(code: "NYC").id, "2028-03-14 12:00:05", "1000"],
  [Airport.find_by(code: "KGA").id, Airport.find_by(code: "AZX").id, "2030-01-10 12:00:05", "3500"],
  [Airport.find_by(code: "KGA").id, Airport.find_by(code: "VIC").id, "2025-06-02 12:00:05", "1200"],
  [Airport.find_by(code: "VIC").id, Airport.find_by(code: "AZX").id, "2026-11-16 12:00:05", "390"],
  [Airport.find_by(code: "VIC").id, Airport.find_by(code: "NYC").id, "2028-03-14 12:00:05", "950"],
  [Airport.find_by(code: "VIC").id, Airport.find_by(code: "NYC").id, "2026-11-16 12:00:05", "950"],
  [Airport.find_by(code: "AZX").id, Airport.find_by(code: "VIC").id, "2026-11-16 12:00:05", "130"],
  [Airport.find_by(code: "AZX").id, Airport.find_by(code: "NYC").id, "2028-03-14 12:00:05", "90"]
].each do |dep, arr, start, length|
  Flight.find_or_create_by!(departure_airport_id: dep, arrival_airport_id: arr, departure_time: start, duration: length)
end