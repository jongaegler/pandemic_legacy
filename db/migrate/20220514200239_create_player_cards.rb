class CreatePlayerCards < ActiveRecord::Migration[7.0]
  def change
    create_table :player_cards do |t|
      t.string :type
      t.belongs_to :city
      t.integer :position
      t.boolean :discarded, default: false
      t.boolean :epidemic, default: false

      t.belongs_to :player
      t.timestamps
    end
  end
end
