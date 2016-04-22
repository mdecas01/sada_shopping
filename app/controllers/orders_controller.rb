class OrdersController < ApplicationController
  before_action :create_cart
  before_action :request_signin_first, only: [:new, :create, :index]
  before_action :allow_admin_user, only: [:destroy]
  
  def index
    if admin_user?
      @orders = Order.all.page(params[:page]).per_page(3)
    else 
      #gets the orders for the specific user
      @orders = Order.where(:user_id => logged_user) 
    end  
  end 
   
  def new 
    @order = Order.new
  end 

  def show
    @order = Order.find(params[:id])
  end  

  def create
      @order = Order.new(order_params)
      #sets the default of dispatched to no
      @order.dispatched = "NO"
      @order.user = logged_user
      @order.add_product(@cart)
      @order.total = @cart.total
      #decreases the quantity in the catalogue according to the order quantity
      change_quantity_in_catalogue(@order)  ##
        if @order.save
          Cart.destroy(session[:id])
          session[:id] = nil
          OrderMailer.received(@order).deliver
          flash[:notice] = "Thanks for shopping with us!"
          redirect_to order_path(@order)
        else
          render :new  
        end 
  end 

  def edit
    @order = Order.find(params[:id]) 
  end  

  def update
    if params[:order].keys[0] == "coupon"
        #EREASE THE IF 
    else       
      @order = Order.find(params[:id])
      @order.update(order_params)
      if @order.send_email?
        OrderMailer.dispatched(@order).deliver
      end  
      redirect_to orders_url
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path, alert: "Order has been deleted"   
  end  

  private

  def order_params
      params.require(:order).permit(:address, :payment_type, :dispatched)
  end

  def change_quantity_in_catalogue(order)
    order.product_items.each do |product_item|
      product = Product.find(product_item.product.id)
      product_item.quantity.to_i.times do 
        product.quantity -= 1
        product.save 
      end
      #sends email to admin if the product quantity is less than 5
        if product.quantity < 5
          ProductMailer.quantity_low(product).deliver
        end 
    end  
  end  
end

