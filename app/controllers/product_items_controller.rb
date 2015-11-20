class ProductItemsController < ApplicationController
  before_action :create_cart, only: [:create]

	def create
      product = Product.find(params[:format])
      @product_item = @cart.product_items.build(product: product)
      if @product_item.save
        redirect_to @product_item.cart
        flash[:notice] = "Product successfully added!"
      else
        render :new  
      end		
	end	
end
