module ApplicationHelper
  #adds the £ currency to the price displayed
  def format_price(product)
    number_to_currency(product.price, unit: "£")
  end
	
  def place_rating(stars)
    case stars
    when 1
      #image_tag("one-star.jpg", class: "rate_img")
      "<b>1</b> out of <b>5</b>"
    when 2
      #image_tag("two-stars.png", class: "rate_img") 
      "<b>2</b> out of <b>5</b>"	
    when 3
      #image_tag("three-stars.png", class: "rate_img")
      "<b>3</b> out of <b>5</b>"
    when 4
      #image_tag("four-stars.png", class: "rate_img")
      "<b>4</b> out of <b>5</b>"
    when 5
      #image_tag("five-star.png", class: "rate_img")
      "<b>5</b> out of <b>5</b>"
    else
      "<b>No reviews</b>"
    end      	  
  end	 
end
