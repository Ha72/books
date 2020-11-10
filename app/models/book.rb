class Book < ApplicationRecord
    has_many :order_books
    has_many :orders, through: :order_books
    
    validates :title, :author, :price, :stock_quantity, :status, presence: true
    validates :stock_quantity, numericality: true
end
