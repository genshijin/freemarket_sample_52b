class RemoveDetailsFromitems < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :sold_items
    remove_column :users, :buyed_items
    remove_column :users, :saling_items
  end
end
