class ApplicationController < ActionController::Base
    before_action :get_genres
    before_action :initialize_session
    before_action :cart
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :get_provinces
    
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
    
    def get_provinces
        @provs = Province.all
    end
    
    
    
    protected
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :address, :city, :province_id])
        devise_parameter_sanitizer.permit(:account_update, keys: [:username, :address, :city, :province_id])
    end
    
end
