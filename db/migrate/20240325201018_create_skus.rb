class CreateSkus < ActiveRecord::Migration[6.1]
  def change
    create_table :skus do |t|
      t.references :product, null: false, foreign_key: true
      t.string :code
      t.string :name
      t.integer :stock
      t.decimal :price_list
      t.decimal :listing_price

      t.timestamps
    end
  end
end
