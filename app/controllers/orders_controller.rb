class OrdersController < ApplicationController
	before_action :create_cart, only: [:new, :create, :index]
  
  def index
    if params[:search]
      @order = Order.find(params[:search])
    else  
      @orders = Order.all
    end  
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
      #sets the default of dispatched to no
      @order.dispatched = "NO"
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

  def destroy
    @order = Order.find(params[:id])
    if @order.order_dispatched?
      @order.destroy
      redirect_to orders_path
    else
      redirect_to orders_path, notice: "The product has not been dispatched yet!"
    end    
  end  

	private

	def order_params
      params.require(:order).permit(:name, :address, :email, :payment_type, :dispatched)
	end	
end
