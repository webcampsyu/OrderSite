class CreateSiteNames < ActiveRecord::Migration[6.1]
  def change
    create_table :site_names do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
