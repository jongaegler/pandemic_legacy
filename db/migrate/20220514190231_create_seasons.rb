class CreateSeasons < ActiveRecord::Migration[7.0]
  def change
    create_table :seasons do |t|
      t.boolean :current, default: true
      t.integer :funding_level, default: 4
      t.timestamps
    end
  end
end
