class InfectionCard < ApplicationRecord
  include Deck
  has_one :city

  # 3 cities get 3, 3 get 2, 3 get 1
  def self.start_game
    [3, 2, 1].each do |cubes|
      3.times { draw(count) }
    end
  end

  def draw(count = 1)
    city.infect(count)
    update(discarded: true)
  end
end
