class ApplicationRecord < ActiveRecord::Base
  AVAILABLE_COLORS = %i(red yellow blue black)
  primary_abstract_class

  delegate :game, :season, to: :class

  def self.game
    Game.find_by(current: true)
  end

  def self.season
    Season.find_by(current: true)
  end
end
