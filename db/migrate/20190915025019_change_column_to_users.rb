class ChangeColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    def up
      change_column :users, :nickname, :string, null: false
    end

    def down
      change_column :users, :nickname, :string, null: true
    end
  end
end
