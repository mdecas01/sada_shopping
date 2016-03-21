module ApplicationHelper
  #adds the £ currency to the price displayed
  def format_price(product)
    number_to_currency(product.price, unit: "£")
  end
	
  def place_rating(stars)
    case stars
    when 1
      image_tag("one-star.jpg")
    when 2
      image_tag("two-stars.png")  	
    when 3
      image_tag("three-stars.png")
    when 4
      image_tag("four-stars.png")
    else
      image_tag("five-star.png")
    end      	  
  end	 
end
