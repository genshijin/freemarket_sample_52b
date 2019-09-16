class CreateBirthms < ActiveRecord::Migration[5.2]
  def change
    create_table :birthms do |t|
      t.integer :month_id
      t.string :month

      t.timestamps
    end
  end
end
