class RemovePostageBurdenFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :postage_burden, :integer
  end
end
