class BooksController < ApplicationController
  def index
    @books = Book.all.page(params[:page]).per(6)
  end

  def show
    @book = Book.find(params[:id])
  end
  
  def new
    @new_books = Book.where("created_at >= ?", Time.new - 3*24*60*60)
                    .page(params[:page]).per(6)
  end
  
  def on_sale
    @sale_books = Book.where(status: "on sale")
                    .page(params[:page]).per(6)
  end
  
  def recently_updated
    @updated_books = Book.where("updated_at >= ?", Time.new - 3*24*60*60)
                        .where("created_at < ?", Time.new - 3*24*60*60)
                        .page(params[:page]).per(3)
  end
  
  def search
      keyword_search = "%#{params[:keyword]}%"
      @genre_search = "#{params[:genre]}"
      
      @search_books = Book.where("title LIKE ? OR description LIKE ?", keyword_search, keyword_search)
      
      if @genre_search != "All Genre"
        genre_id = Genre.find_by(genre: @genre_search)
        @search_books = @search_books.where(genre_id: genre_id)
      end
      
      @paginated_books = @search_books.page(params[:page]).per(6)
  end
end
