class CreateOrderBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :order_books do |t|
      t.integer :quantity
      t.decimal :price

      t.timestamps
    end
  end
end
