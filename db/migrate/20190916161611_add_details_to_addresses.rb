class AddDetailsToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_reference :addresses, :user, foreign_key: true, null: false
    add_column :addresses, :first_name, :string, null: false
    add_column :addresses, :first_name_kana, :string, null: false
    add_column :addresses, :last_name, :string, null: false
    add_column :addresses, :last_name_kana, :string, null: false
    add_column :addresses, :postal_code, :string, null: false
    add_column :addresses, :address, :string, null: false
    add_column :addresses, :building_name, :string
    add_column :addresses, :phone_number, :string
  end
end
