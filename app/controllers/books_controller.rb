class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end
  
  def new
    @new_books = Book.where(status: "new")
  end
  
  def on_sale
    @sale_books = Book.where(status: "on sale")
  end
  
  def recently_updated
    @updated_books = Book.where(status: "recently updated")
  end
end
