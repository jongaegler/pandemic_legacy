class CreatePlayerCards < ActiveRecord::Migration[7.0]
  def change
    create_table :player_cards do |t|
      t.boolean :dealt, default: false
      t.boolean :discarded, default: false
      t.belongs_to :player

      t.timestamps
    end
  end
end
