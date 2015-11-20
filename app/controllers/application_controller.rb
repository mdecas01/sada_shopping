class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def create_cart
    @cart = Cart.find(session[:id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:id] = @cart.id
  end
end
