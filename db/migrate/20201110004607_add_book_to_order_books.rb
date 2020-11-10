class AddBookToOrderBooks < ActiveRecord::Migration[6.0]
  def change
    add_reference :order_books, :book, null: false, foreign_key: true
  end
end
