class Season < ApplicationRecord
  has_many :games
  has_many :rules

  def setup_season
    game = Game.create!(month: Date::MONTHNAMES[Date.today.month])
    game.setup_game
  end
end
