class Game < ApplicationRecord
  validates :infection_rate, numericality: { in: 2..4 }
  validates :outbreak_counter, numericality: { in: 0..8 }
  def begin
  end
end
