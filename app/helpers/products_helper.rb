module ProductsHelper
	#checks if product was created in less than 1 day
	def new_product(product)	
    if product.new?
      "(NEW!!!)"
    end	
	end	

    #adds the £ currency to the price displayed
	def format_price(product)
    number_to_currency(product.price, unit: "£")
  end

  def product_availability(product)
    if product.available?
      product.quantity
    else
      "not currently available"
    end    
  end  

  def place_image(product)
    if product.image_url.blank?
      image_tag("no-image.jpg")
    else
      image_tag(product.image_url)
    end    
  end  
end
