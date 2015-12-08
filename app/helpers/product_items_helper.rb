module ProductItemsHelper
	def display_add_button(product)
      if product.available?
      	 button_to "Add to cart", product_items_path(product: @product), remote: true, class: "button" 
      else
       "Not currently available"
      end	
	end	
end
