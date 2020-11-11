class BooksController < ApplicationController
  def index
    @books = Book.all.page(params[:page]).per(6)
  end

  def show
    @book = Book.find(params[:id])
  end
  
  def new
    @new_books = Book.where(status: "new")
                    .page(params[:page]).per(3)
  end
  
  def on_sale
    @sale_books = Book.where(status: "on sale")
                    .page(params[:page]).per(3)
  end
  
  def recently_updated
    @updated_books = Book.where(status: "recently updated")
                        .page(params[:page]).per(3)
  end
  
  def search
      keyword_search = "%#{params[:keyword]}%"
      @genre_search = "#{params[:genre]}"
      
      if @genre_search == "All Genre"
        @search_books = Book.where("title LIKE ?", keyword_search)
      else
        genre_id = Genre.find_by(genre: @genre_search)
        @search_books = Book.where("title LIKE ?", keyword_search)
                            .where(genre_id: genre_id)
      end
      
      @paginated_books = @search_books.page(params[:page]).per(3)
  end
end
