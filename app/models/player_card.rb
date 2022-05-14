class PlayerCard < ApplicationRecord
  belongs_to :player

  scope :undealt -> { where(dealt: false, discarded: false) }

  def self.draw
    card = undealt.first
  end
end
