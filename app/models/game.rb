class Game < ApplicationRecord
  belongs_to :season
  has_many :objectives
  validates :infection_rate, numericality: { in: 2..4 }
  validates :outbreak_counter, numericality: { in: 0..8 }
  MAX_RESEARCH_STATIONS = 6

  def setup_game
    # assign mission brieifing
    City.place_starting_structures
    Disease.reset_to_default
    InfectionCard.start_game
    # Add cards based on funding level to deck
    # shuffle
    deal
    # set starting location
  end

  def win_game
    update(win: true)
    season.decrement!(:funding_level, 2)
    # get win bonus
    end_game
  end

  def lose_game
    update(win: false)
    season.increment!(:funding_level, 2)
    end_game
  end

  def end_game
    # choose upgrades
    update(current: false)
  end

  private

  def deal
    cards_dealt = 6 - Player.count
    cards_dealt.times do
      Player.each { |player| player.draw }
    end
  end
end
