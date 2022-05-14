class City < ApplicationRecord
  BLUE_CITIES = %w(San\ Francisco Chicago Atlanta Washington Montreal New\ York Madrid London Essen Paris Milan St.\ Petersburg)
  YELLOW_CITIES = %w(Bogota Buenos\ Aries Johannesburg Khartoum Kinshasa Lagos Lima Los\ Angeles Mexico\ City Miami Santiago Sao\ Paulo)
  BLACK_CITIES = %w(Algiers Baghdad Cairo Chennai Delhi Istanbul Karachi Kolkata Moscow Mumbai Riyadh Tehran)
  RED_CITIES = %w(Bangkok Beijing Ho\ Chi\ Minh\ City Hong\ Kong Jakarta Manila Osaka Seoul Shanghai Sydney Taipei Tokyo)
  ALL_CITIES = BLUE_CITIES + YELLOW_CITIES + BLACK_CITIES + RED_CITIES

  def self.place_starting_structures
    where(starts_with_research_station: true).update_all(research_station: true)
  end

  def connected_cities
    # Parse hack until switching to postgres
    City.where(id: JSON.parse(city_connections))
  end

end
