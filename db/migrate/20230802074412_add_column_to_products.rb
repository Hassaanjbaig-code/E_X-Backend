class AddColumnToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :quantity, :decimal, default: 0
  end
end
