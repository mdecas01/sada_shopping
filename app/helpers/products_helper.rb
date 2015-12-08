module ProductsHelper
	#checks if product was created in less than 1 day
	def new_product(product)	
    if product.new?
      "(NEW!!!)"
    end	
	end	
  
  def product_availability(product)
    if product.available?
      product.quantity
    else
      "Not currently available"
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
