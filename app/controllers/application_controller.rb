class ApplicationController < ActionController::Base
    before_action :get_genres
    before_action :initialize_session
    before_action :cart
    
    private
    
    def get_genres
        @nav_genres = Array.new(1, "All Genre")
        
        Genre.all.each do |g|
            @nav_genres.push(g.genre)
        end
    end
    
    def cart
        books = session[:cart].map { |c| c[0] }
        @cart_books = Book.find(books)
        
        @size = 0
        session[:cart].each do |c|
            @size += c[1]
        end
    end
    
    def initialize_session
        session[:cart] ||= [] # Cart defaults to an empty array
    end
    
end
