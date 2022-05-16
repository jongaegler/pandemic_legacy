class ApplicationRecord < ActiveRecord::Base
  AVAILABLE_COLORS = %i(red yellow blue black)
  primary_abstract_class

  def game
    Game.find_by(current: true)
  end

  def season
    Season.find_by(current: true)
  end
end
