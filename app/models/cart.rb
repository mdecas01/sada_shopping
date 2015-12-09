class Cart < ActiveRecord::Base

  has_many :product_items, dependent: :destroy	
  belongs_to :user

  def add_product_item(product)
    productItem = Product.find(product.id)
    if productItem.quantity > 0  
    item = product_items.find_by(product_id: product.id)
    if item
      #increases the quantity in the cart
      item.quantity += 1
      #decreases the quantity in the catalogue
      productItem.quantity -= 1
      productItem.save
    else
      item = product_items.build(product_id: product.id)
      productItem.quantity -= 1
      productItem.save
    end
    item 
    else
      false
    end    
  end	

  def return_product_to_catalogue
    product_items.each do |p_item|
      product = Product.find(p_item.product_id)
      p_item.quantity.times do
        product.quantity += 1
        product.save
      end
    end  
  end  

  def total_price
    product_items.to_a.sum { |item| item.total_price }
  end  
end
