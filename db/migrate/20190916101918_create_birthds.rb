class CreateBirthds < ActiveRecord::Migration[5.2]
  def change
    create_table :birthds do |t|
      t.integer :day_id
      t.string :day

      t.timestamps
    end
  end
end
