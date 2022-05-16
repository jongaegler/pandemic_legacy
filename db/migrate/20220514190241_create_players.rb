class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.belongs_to :city
      t.integer :actions, default: 4

      t.timestamps
    end
  end
end
