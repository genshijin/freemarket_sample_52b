class CreateSellcs < ActiveRecord::Migration[5.2]
  def change
    create_table :sellcs do |t|
      t.integer :category_id
      t.string :category

      t.timestamps
    end
  end
end
