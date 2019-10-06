class AddClumnToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :state_id, :integer,null: false
    add_column :items, :shipping_date_id, :integer,null: false
    add_column :items, :shipping_origin_area_id, :integer,null: false
    add_column :items, :postage_burden_id, :integer,null: false
    add_column :items, :shipping_way_id, :integer
  end
end
