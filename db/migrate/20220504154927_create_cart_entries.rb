class CreateCartEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_entries do |t|
      t.references :product, null: false, foreign_key: true
      t.references :cart, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
