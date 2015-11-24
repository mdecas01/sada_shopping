module CartsHelper
	def check_product_quantities(cart)
	sum = 0
      cart.product_items.each do |product_item|
      	sum += product_item.quantity
      end	
    sum
  end
end


