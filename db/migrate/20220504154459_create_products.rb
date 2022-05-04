class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.decimal :price_retail_cents
      t.string :product_category

      t.timestamps
    end
  end
end
