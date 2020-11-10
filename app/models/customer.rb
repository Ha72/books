class Customer < ApplicationRecord
    belongs_to :province
    has_many :orders
    
    validates :username, :password, presence: true
    validates :username, uniqueness: true
end
