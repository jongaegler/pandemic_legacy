City::ALL_CITIES.each do |city|
  city = City.create!(name: city)
  city.create_infection_card!
  city.create_city_card!
end

Disease::AVAILABLE_COLORS.each do |color|
  City.where(name: City.const_get("#{color.upcase}_CITIES")).update_all(color: color)
  Disease.create(color: color)
end
City.find_by(name: 'Atlanta').update(starts_with_research_station: true)
