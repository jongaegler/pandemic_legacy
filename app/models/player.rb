class Player < ApplicationRecord
  MAX_ACTIONS = 4
  CARDS_FOR_CURE = 5
  MAX_CARDS = 7

  has_many :player_cards
  has_many :scars
  has many :upgrades

  def draw
    card = PlayerCard.draw
    return card.epidemic if card.epidemic?
    card.update(player: self)
  end

  def move(city)
    update(city_id: city.id)
  end

  def treat(city, color)
    city["#{color}_cubes"] = treat_all?(color) ? 0 : city["#{color}_cubes"] - 1

    city.save!
  end

  def direct_flight
  end

  def charter_flight
  end

  def shuttle_flight
  end

  def share_knowledge
  end

  def build_structure
  end

  def discover_cure(disease)
    return unless can_cure?(disease)
  end

  def add_scar
  end

  private

  # has_many through city maybe
  def can_cure?(disease)
    return false if disease.cured?
    return false unless city.research_station?

    player_cards.where(color: disease.color).count >= CARDS_FOR_CURE
  end

  def treat_all?(color)
    Disease.send(color).cured?
  end

  def can_perform_action?
    actions > 0
  end
end
