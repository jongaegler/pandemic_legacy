class Player < ApplicationRecord
  has_many :player_cards

  def draw
    card = PlayerCard.draw
    card.update(player: self)
  end
end
