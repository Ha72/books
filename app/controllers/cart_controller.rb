class CartController < ApplicationController
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
        
        redirect_to root_path
        
        # logger.debug("Cart Create triggered")
        # logger.debug("Adding book id #{params[:id]}")
    end
    
    # DELETE /cart/:id, Remove book from the cart
    def destroy
        id = params[:id].to_i
        cart_books = session[:cart].map { |c| c[0] }
        
        session[:cart].delete_at(cart_books.index(id))
        
        redirect_to root_path
        
        # logger.debug("Cart Destroy triggered")
    end
end
