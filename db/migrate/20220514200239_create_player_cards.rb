class CreatePlayerCards < ActiveRecord::Migration[7.0]
  def change
    create_table :player_cards do |t|

      t.timestamps
    end
  end
end
