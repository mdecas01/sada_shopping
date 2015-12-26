class CartsController < ApplicationController

  before_action :create_cart, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :id_not_found

  def show
    @cart = Cart.find(params[:id])
  end	

  def update
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
