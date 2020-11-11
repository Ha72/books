class ApplicationController < ActionController::Base
    before_action :get_genres
    
    def get_genres
        @nav_genres = Array.new(1, "All Genre")
        
        Genre.all.each do |g|
            @nav_genres.push(g.genre)
        end
    end
    
end
