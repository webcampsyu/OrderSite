class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :site_name
      t.string :address
      t.integer :total_price

      t.timestamps
    end
  end
end
