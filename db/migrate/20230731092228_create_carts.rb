class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.decimal :quantity, default: 0
      t.decimal :total_price, default: 0  # Corrected line
      t.references :user, null: false, foreign_key: true  # Changed from :users to :user
      t.references :product, null: false, foreign_key: true  # Changed from :products to :product

      t.timestamps
    end
  end
end
