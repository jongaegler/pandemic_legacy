class Game < ApplicationRecord
  belongs_to :season
  validates :infection_rate, numericality: { in: 2..4 }
  validates :outbreak_counter, numericality: { in: 0..8 }
  MAX_RESEARCH_STATIONS = 6

  def setup_game
    # assign mission brieifing
    City.place_starting_structures
    Disease.reset_to_default
    # Add cards based on funding level to deck
    # shuffle
    deal
    # set starting location
  end

  private

  def deal
    cards_dealt = 6 - Player.count
    cards_dealt.times do
      Player.each { |player| player.draw }
    end
  end
end
