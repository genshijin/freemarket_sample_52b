class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :comment, null: false
      t.integer :price, null: false
      t.string :state, null: false
      t.integer :postage_burden, null: false
      t.string :shipping_date, null: false
      t.string :shipping_origin_area, null: false
      t.integer :buyer_id, foreign_key: true
      t.integer :seller_id, null: false,foreign_key: true
      t.integer :category_id, null: false,foreign_key: true

      t.timestamps
    end
  end
end
