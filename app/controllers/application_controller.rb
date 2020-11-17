class ApplicationController < ActionController::Base
    before_action :get_genres
    before_action :initialize_session
    helper_method :cart
    
    private
    
    def get_genres
        @nav_genres = Array.new(1, "All Genre")
        
        Genre.all.each do |g|
            @nav_genres.push(g.genre)
        end
    end
    
    def cart
        Book.find(session[:cart])
    end
    
    def initialize_session
        session[:cart] ||= [] # Cart defaults to an empty array
    end
    
end
