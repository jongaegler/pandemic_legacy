class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.boolean :dead, default: false
      t.boolean :unlocked

      t.timestamps
    end
  end
end
