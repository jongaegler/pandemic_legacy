module Deck
  extend ActiveSupport::Concern
  included do
    default_scope { order(:position) }
  end

  # Can pass in just discarded
  def self.shuffle(cards = all)
    cards.shuffle.each_with_index do |card, i|
      card.update(position: i + 1)
    end
  end
end
