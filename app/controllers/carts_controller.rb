class CartsController < ApplicationController

  before_action :create_cart
  rescue_from ActiveRecord::RecordNotFound, with: :id_not_found

  def show
    @cart = Cart.find(params[:id])
  end 

  def update
    #fail
    @cart = Cart.find(params[:id])
        #gets the coupon entered in the form
        @coupon = Coupon.find_by(token: params[:cart].values[0]) ###############
        if @coupon
          if @coupon.redeemed? == true
            flash.now[:alert] = "Coupon invalid!"
            render :edit
          else  
            if @coupon.name == logged_user.name || @coupon.name == "promo"
              @cart.coupon = @coupon.discount
              #will be used to assign the total to the order
              @cart.total_price(@coupon.discount)
              @cart.save
              @coupon.redeem
              @coupon.save 
              redirect_to edit_cart_path(@cart), notice: "You total was discounted"
            else
              flash.now[:alert] = "Coupon invelid!"
              render :edit
            end  
          end 
        else
          flash.now[:alert] = "Please enter a valid coupon!"
          render :edit
        end 
  end  

  def destroy
    if @cart.id == session[:id]
      #@cart.return_product_to_catalogue
      @cart.destroy
      session[:id] = nil
      redirect_to products_url, notice: 'Shopping cart is empty!'
    end  
  end  

  private

  def id_not_found
    flash[:notice] = 'Sorry, cart not found!'
    redirect_to products_url
  end 
end

