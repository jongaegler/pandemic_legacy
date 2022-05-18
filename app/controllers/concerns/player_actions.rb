module PlayerActions
  extend ActiveSupport::Concern

  def move(city)
    update(city_id: city.id)
  end

  def treat(city, color)
    city.cubes[color] = treat_all?(color) ? 0 : city.cubes[color] - 1

    city.save!
  end

  def direct_flight
  end

  def charter_flight
  end

  def shuttle_flight
  end

  def share_knowledge(card, player)
  end

  def build_structure(type)
  end

  def discover_cure(disease, cards)
    return unless can_cure?(disease)
    disease.update(cured: true)
    cards.update_all(discarded: true)
  end

  def can_build_structure?
  end

  def can_share_knowledge?
  end

  def can_treat?(disease)
    disease.treatable? && city.cubes[disease.color] > 0
  end

  # has_many through city maybe
  def can_cure?(disease)
    return false if disease.cured?
    return false unless city.research_station?

    player_cards.where(color: disease.color).count >= CARDS_FOR_CURE
  end
end
