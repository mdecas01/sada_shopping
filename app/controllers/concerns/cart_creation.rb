module CartCreation
  extend ActiveSupport::Concern
  
  private

  def create_cart
    @cart = Cart.find(session[:id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:id] = @cart.id
  end
end