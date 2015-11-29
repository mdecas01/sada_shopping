class ProductItemsController < ApplicationController

  before_action :create_cart, only: [:create]

	def create
      product = Product.find(params[:product])
      @product_item = @cart.add_product_item(product)
      respond_to do |format|
        if @product_item.save
          format.html { redirect_to product }
          #[:notice] = "Product successfully added!"
          format.js
        else
          render :new  
        end	
      end  	
	end

  private

  def product_item_params
    params.require(:product_item).permit(:product)
  end	
end
