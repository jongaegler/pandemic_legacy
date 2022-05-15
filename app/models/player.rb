class Player < ApplicationRecord
  has_many :player_cards
  has_many :scars
  has many :upgrades

  def draw
    card = PlayerCard.draw
    card.update(player: self)
  end

  # Traveling salesman. Will cache location since they are finite
  def available_locations
  end

  def move
  end
end
