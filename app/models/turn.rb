class Turn < ApplicationRecord
  belongs_to :player

  def start_turn
  end

  def end_turn
    player.draw
    player.draw
    game.infection_rate.times do |i|
      InfectionCard.draw
    end
  end
end
