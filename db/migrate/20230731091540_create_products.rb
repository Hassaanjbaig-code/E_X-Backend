class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :category
      t.decimal :price, default: 0
      t.string :image_url
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
