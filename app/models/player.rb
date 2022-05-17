class Player < ApplicationRecord
  include PlayerActions

  MAX_ACTIONS = 4
  CARDS_FOR_CURE = 5
  MAX_CARDS = 7

  has_many :player_cards
  has_many :scars
  has many :upgrades

  CHARACTERS = %w(dispatcher generalist medic scientist researcher)
  CHARACTERS.each do |character|
    define_method("#{character}?") do
      name == character
    end
  end

  def draw
    card = PlayerCard.draw
    return card.epidemic if card.epidemic?
    card.update(player: self)
  end

  def add_scar
  end

  private

  def treat_all?(color)
    Disease.send(color).cured?
  end
end
