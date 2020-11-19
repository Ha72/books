class CartController < ApplicationController
    include Devise::Controllers::Helpers
    
    # POST /cart, Add params[:id] book to the cart
    def create
        id = params[:id].to_i
        qty = params[:qty].to_i
        
        cart_books = session[:cart].map { |c| c[0] }
        
        if cart_books.include?(id)
            session[:cart][cart_books.index(id)] = [id, qty]
        else
            session[:cart] << [id, qty]
        end
        
        # @cart_qty = session[:cart][cart_books.index(id)][1].to_i
        
        redirect_back(fallback_location: root_path)
        
        # logger.debug("Cart Create triggered")
        # logger.debug("Adding book id #{params[:id]}")
    end
    
    # DELETE /cart/:id, Remove book from the cart
    def destroy
        id = params[:id].to_i
        cart_books = session[:cart].map { |c| c[0] }
        
        session[:cart].delete_at(cart_books.index(id))
        
        redirect_back(fallback_location: root_path)
        
        # logger.debug("Cart Destroy triggered")
    end
    
    def index
        @cart = []
        @subtotal = 0
        
        session[:cart].each do |c|
            book = Book.find(c[0])
            @cart << [book, c[1]]
            
            @subtotal += book.price * c[1]
        end
    end
    
    def review
        @cart = []
        @subtotal = 0
        
        session[:cart].each do |c|
            book = Book.find(c[0])
            @cart << [book, c[1]]
            
            @subtotal += book.price * c[1]
        end
        
        @gst = @subtotal * current_customer.province.gst / 100
        @pst = @subtotal * current_customer.province.pst / 100
        @total = @subtotal + @gst + @pst
    end
    
    def save
        
    end
end
