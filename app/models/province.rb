class Province < ApplicationRecord
    has_many :customers
    
    validates :name, :gst, :pst, presence: true
    validates :name, uniqueness: true
end
