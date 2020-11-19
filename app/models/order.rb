class Order < ApplicationRecord
    belongs_to :customer
    has_many :order_books
    has_many :books, through: :order_books
end
