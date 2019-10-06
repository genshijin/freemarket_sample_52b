class RemoveClomnFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :state, :string
    remove_column :items, :shipping_date, :string
    remove_column :items, :shipping_origin_area, :string
    remove_column :items, :postage_burden, :integer
  end
end
