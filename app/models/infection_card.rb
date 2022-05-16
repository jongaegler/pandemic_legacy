class InfectionCard < ApplicationRecord
  has_one :city

  # 3 cities get 3, 3 get 2, 3 get 1
  def self.start_game
    3.times do |cubes|
      3.times do |i|
      end
    end
  end
  def draw
    city.infect
    update(discarded: true)
  end
end
