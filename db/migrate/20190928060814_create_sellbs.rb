class CreateSellbs < ActiveRecord::Migration[5.2]
  def change
    create_table :sellbs do |t|
      t.integer :burden_id
      t.string :burden

      t.timestamps
    end
  end
end
