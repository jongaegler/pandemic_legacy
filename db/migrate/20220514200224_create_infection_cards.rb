class CreateInfectionCards < ActiveRecord::Migration[7.0]
  def change
    create_table :infection_cards do |t|
      t.belongs_to :city
      t.boolean :discarded, default: false

      t.timestamps
    end
  end
end
