class CreateProductItems < ActiveRecord::Migration[6.1]
  def change
    create_table :product_items do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
