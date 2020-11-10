class Genre < ApplicationRecord
    has_many :books
    
    validates :genre, presence: true
    validates :genre, uniqueness: true
end
