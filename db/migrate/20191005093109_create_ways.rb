class CreateWays < ActiveRecord::Migration[5.2]
  def change
    create_table :ways do |t|
      t.integer :way_id
      t.string :name

      t.timestamps
    end
  end
end
