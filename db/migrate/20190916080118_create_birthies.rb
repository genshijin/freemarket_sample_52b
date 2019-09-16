class CreateBirthies < ActiveRecord::Migration[5.2]
  def change
    create_table :birthies do |t|
      t.integer :year_id
      t.string :year

      t.timestamps
    end
  end
end
