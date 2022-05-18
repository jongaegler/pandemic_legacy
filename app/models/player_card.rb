class PlayerCard < ApplicationRecord
  include ::Deck
  belongs_to :player

  scope :undealt, -> { where(player_id: nil, discarded: false) }

  def self.draw
    card = undealt.first
  end

  def epidemic
    game.increment!(:infection_rate)
    # infect undealt.last
    # intensify
  end
end
