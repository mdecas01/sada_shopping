class ProductItemsController < ApplicationController
  include CartCreation
  before_action :create_cart, only: [:create]

	def create
      product = Product.find(params[:format])
      @product_item = @cart.product_items.build(product: product)
      if @product_item.save
        flash[:notice] = "Product successfully added!"
        redirect_to product
      else
        render :new  
      end		
	end	
end
