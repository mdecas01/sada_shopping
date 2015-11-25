class ProductItemsController < ApplicationController

  before_action :create_cart, only: [:create]

	def create
      product = Product.find(params[:format])
      @product_item = @cart.add_product_item(product)
      if @product_item.save
        redirect_to product
        flash[:notice] = "Product successfully added!"
      else
        render :new  
      end		
	end

  private

  def product_item_params
    params.require(:line_item).permit(:product_id)
  end	
end
