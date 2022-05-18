class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.belongs_to :city
      t.string :name
      t.integer :actions, default: 4
      t.belongs_to :character

      t.timestamps
    end
  end
end
