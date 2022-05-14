class CreateInfectionCards < ActiveRecord::Migration[7.0]
  def change
    create_table :infection_cards do |t|

      t.timestamps
    end
  end
end
