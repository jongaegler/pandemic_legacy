module LegacyDeck
  def january_start
    game.update(mission_briefing: I18n.t(:january_start))
    Objective.create(description: 'Discover cures to the 4 diseases', mandatory: true)
  end

  def january_middle
    game.update(mission_briefing: I18n.t(:january_briefing_update))
    Objective.first.update(active: false)
    Objective.create(description: 'Discover cures to the 3 normal diseases', mandatory: true)
    disease_to_mutate.update(name: 'COdA-403a')
  end

  private
  def disease_to_mutate
    Disease.order(:cubes_left).first
  end
end
