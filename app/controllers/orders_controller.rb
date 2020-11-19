class OrdersController < ApplicationController
    include Devise::Controllers::Helpers

    def index
    end

    def show
    end

    def create
        cart = []
        subtotal = 0
        
        session[:cart].each do |c|
            book = Book.find(c[0])
            cart << [book, c[1]]
            
            subtotal += book.price * c[1]
        end
        
        gst = subtotal * current_customer.province.gst / 100
        pst = subtotal * current_customer.province.pst / 100
        total = subtotal + gst + pst

        order = Order.create(
                    customer_id: current_customer.id,
                    subtotal: subtotal,
                    gst: gst,
                    pst: pst,
                    total: total,
                    status: "Pending"
                )
        
        cart.each do |c|
            if order&.valid?
                order_book = OrderBook.create(
                                order: order,
                                book: c[0],
                                quantity: c[1],
                                price: c[0].price
                            )
            end
        end
        
        session[:cart] = []
        
        redirect_to review_order_path
    end
end
