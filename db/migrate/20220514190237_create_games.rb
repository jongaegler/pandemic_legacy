class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :month, null: false
      t.boolean :win
      t.boolean :current, default: true
      t.integer :outbreak_counter, default: 0
      t.integer :infection_rate, default: 2
      t.integer :funding_level, default: 4
      t.integer :legacy_deck_counter, default: 0
      t.string :mission_briefing
      t.integer :objectives_required, default: 1

      t.timestamps
    end
  end
end
