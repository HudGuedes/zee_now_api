class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :slug
      t.string :name
      t.text :description
      t.string :manufacturer
      t.boolean :active

      t.timestamps
    end
  end
end
