class CreateSellhs < ActiveRecord::Migration[5.2]
  def change
    create_table :sellhs do |t|
      t.integer :date_id
      t.string :date

      t.timestamps
    end
  end
end
