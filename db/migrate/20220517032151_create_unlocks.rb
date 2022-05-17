class CreateUnlocks < ActiveRecord::Migration[7.0]
  def change
    create_table :unlocks do |t|

      t.timestamps
    end
  end
end
