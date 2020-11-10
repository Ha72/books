class AddOrderToOrderBooks < ActiveRecord::Migration[6.0]
  def change
    add_reference :order_books, :order, null: false, foreign_key: true
  end
end
