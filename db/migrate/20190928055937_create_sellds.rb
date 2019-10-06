class CreateSellds < ActiveRecord::Migration[5.2]
  def change
    create_table :sellds do |t|
      t.integer :state_id
      t.string :state

      t.timestamps
    end
  end
end
