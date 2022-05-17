class CreateDiseases < ActiveRecord::Migration[7.0]
  def change
    create_table :diseases do |t|
      t.string :color
      t.string :name
      t.integer :cubes_left, default: 24
      t.boolean :cured, default: false
      t.boolean :eradicated, default: false
      t.boolean :mutated, default: false
      t.boolean :treatable, default: true
      t.timestamps
    end
  end
end
