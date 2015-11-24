class CartsController < ApplicationController

  before_action :create_cart, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :id_not_found

  def show
    @cart = Cart.find(params[:id])
  end	

  protected

  def id_not_found
    flash[:notice] = 'Sorry, cart not found!'
    redirect_to products_url
  end	
end
