class Objective < ApplicationRecord
  scope :active, { where(active: true) }
  scope :complete, { where(complete: true) }

  after_commit :check_win

  def self.mandatory
    active.find_by(mandatory: true)
  end

  def self.check_win
    active.complete.count > game.objectives_required && mandatory.complete?
  end

  def check_win
    self.class.check_win
  end
end
