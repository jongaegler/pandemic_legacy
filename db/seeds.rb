# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ALL_CITIES.each do |city|
  City.create(name: city)
end
Disease::AVAILABLE_COLORS.each do |color|
  Disease.create(color: color)
end
# Assign color
# City.where(name: BLUE_CITIES).update_all(disease: )
City.find_by(name: 'Atlanta').update(starts_with_research_station: true)
