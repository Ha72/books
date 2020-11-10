class Order < ApplicationRecord
    has_many :order_books
    has_many :books, through: :order_books
end
