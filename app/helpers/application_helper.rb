module ApplicationHelper
  #adds the £ currency to the price displayed
  def format_price(product)
    number_to_currency(product.price, unit: "£")
  end
	
end
