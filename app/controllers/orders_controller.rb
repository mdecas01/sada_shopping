class OrdersController < ApplicationController
	before_action :create_cart, only: [:new, :create, :index]
  
  def index
    @orders = Order.all
  end 
   
	def new
		###NOT SURE IF NEED THIS COS AN EMPTY CART WONT BE SHOWN ANYWAY
	  #redirects the user to the main page if the cart is empty
      if @cart.product_items.empty?
        redirect_to products_url, notice: "cart is empty"
      end	

      @order = Order.new
	end	

	def create
      @order = Order.new(order_params)
      @order.add_product(@cart)
      if @order.save
      	Cart.destroy(session[:id])
      	session[:id] = nil
        OrderMailer.received(@order).deliver
        flash[:notice] = "Thanks for shopping with us!"
        redirect_to products_url
      else
        render :new  
      end	
	end	

  def edit
    @order = Order.find(params[:id]) 
  end  

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.send_email?
      OrderMailer.dispatched(@order).deliver
    end  
    redirect_to orders_url

  end  

	private

	def order_params
      params.require(:order).permit(:name, :address, :email, :payment_type, :dispatched)
	end	
end
