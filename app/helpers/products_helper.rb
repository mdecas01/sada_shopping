module ProductsHelper
	#checks if product was created in less than 1 day
	def new_product(product)	
    if product.new?
      "(NEW!!!)"
    end	
	end	
  
  def product_availability(product)
    if product.available?
      "<div id='instock'>IN STOCK</div>"
    else
      "<div id='outstock'>'OUT OF STOCK'</div>"
    end    
  end  

  def place_image(product)
    if product.image_url.blank?
      image_tag("no-image.jpg")
    else
      image_tag(product.image_url)
    end    
  end 

  def display_add_button(product)
      if product.available?
         button_to "Add to cart", product_items_path(product: @product), remote: true, id: "addbtn", class: "button"
      else
       "<div id='not_available'><b>Not currently available</b></div>"
      end 
  end 
end
