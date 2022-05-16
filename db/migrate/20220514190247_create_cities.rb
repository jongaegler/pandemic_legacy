class CreateCities < ActiveRecord::Migration[7.0]
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.string :color, null: false
      t.string :city_connections, array: true
      t.integer :panic_level, default: 0
      t.boolean :starts_with_research_station, default: false
      t.boolean :research_station, default: false
      t.integer :red_cubes, default: 0
      t.integer :blue_cubes, default: 0
      t.integer :black_cubes, default: 0
      t.integer :yellow_cubes, default: 0

      t.timestamps
    end
  end
end
