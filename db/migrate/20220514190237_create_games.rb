class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :month, null: false
      t.boolean :win
      t.integer :outbreak_counter, default: 0
      t.integer :infection_rate, default: 2
      t.timestamps
    end
  end
end
