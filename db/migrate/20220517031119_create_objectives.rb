class CreateObjectives < ActiveRecord::Migration[7.0]
  def change
    create_table :objectives do |t|
      t.boolean :active, default: true
      t.boolean :complete, default: false
      t.boolean :mandatory, default: false
      t.string :description

      t.timestamps
    end
  end
end
