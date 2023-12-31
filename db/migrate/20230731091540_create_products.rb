class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :category
      t.decimal :price, default: 0
      t.string :desc
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
