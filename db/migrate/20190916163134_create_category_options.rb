class CreateCategoryOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :category_options do |t|
      t.references :category, null: false, foreign_key: true
      t.string :size, null: false
      t.string :brand, null: false

      t.timestamps
    end
  end
end
