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
end
