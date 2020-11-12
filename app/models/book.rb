class Book < ApplicationRecord
    belongs_to :genre
    has_many :order_books
    has_many :orders, through: :order_books
    
    validates :title, :author, :price, :stock_quantity, presence: true
    validates :stock_quantity, numericality: true
    
    has_one_attached :image
end
