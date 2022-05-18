class City < ApplicationRecord
  BLUE_CITIES = %w(San\ Francisco Chicago Atlanta Washington Montreal New\ York Madrid London Essen Paris Milan St.\ Petersburg)
  YELLOW_CITIES = %w(Bogota Buenos\ Aries Johannesburg Khartoum Kinshasa Lagos Lima Los\ Angeles Mexico\ City Miami Santiago Sao\ Paulo)
  BLACK_CITIES = %w(Algiers Baghdad Cairo Chennai Delhi Istanbul Karachi Kolkata Moscow Mumbai Riyadh Tehran)
  RED_CITIES = %w(Bangkok Beijing Ho\ Chi\ Minh\ City Hong\ Kong Jakarta Manila Osaka Seoul Shanghai Sydney Taipei Tokyo)
  ALL_CITIES = BLUE_CITIES + YELLOW_CITIES + BLACK_CITIES + RED_CITIES

  has_one :infection_card
  has_one :city_card, class_name: 'PlayerCards::CityCard'
  has_many :players

  def self.place_starting_structures
    where(starts_with_research_station: true).update_all(research_station: true)
  end

  def default_disease
    Disease.send(color)
  end

  def infect(disease, count = 1)
    return oubreak if will_outbreak?(d, count)

    cubes[color] += count
    save!
  end

  def outbreak
    connected_cities.each { |city| city.infect(disease) }
    city.players.each(&:add_scar)
    increment!(:panic_level)
    game.increment!(:outbreak_counter)
  end

  def will_outbreak?(disease, count)
    cubes[color] + count > 3
  end

  def connected_cities
    # Parse hack until switching to postgres
    City.where(id: JSON.parse(city_connections))
  end

  def panic_state
    case panic_level
    when 0, nil then :normal
    when 1      then :unstable
    when 2, 3   then :rioting
    when 4      then :collapsing
    else
      :fallen
    end
  end
end
