class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.references :genre, null: false, foreign_key: true
      t.string :name
      t.string :size
      t.text :explanation
      t.integer :price
      t.boolean :sells_status

      t.timestamps
    end
  end
end
