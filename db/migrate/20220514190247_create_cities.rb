class CreateCities < ActiveRecord::Migration[7.0]
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.string :city_connections, array: true
      t.integer :panic_level, default: 0
      t.boolean :starts_with_research_station, default: false
      t.boolean :research_station, default: false

      t.timestamps
    end
  end
end
