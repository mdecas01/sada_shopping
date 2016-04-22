class Cart < ActiveRecord::Base

  has_many :product_items, dependent: :destroy	
  belongs_to :user

  def add_product_item(product)
    product_item = Product.find(product.id)
    if product_item.quantity > 0  
    item = product_items.find_by(product_id: product.id)
    if item
      #increases the quantity in the cart
      item.quantity += 1
      item.save
      #decreases the quantity in the catalogue
      #product_item.quantity -= 1
     # product_item.save
    else
      item = product_items.build(product_id: product.id)
     # product_item.quantity -= 1
     # product_item.save
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

  def total_price(amount)
     if amount
       total = product_items.to_a.sum { |item| item.total_price }
       self.total = (total - (total * (BigDecimal(amount) * 0.01))).round(2) 
     else
      self.total = product_items.to_a.sum { |item| item.total_price }
     end
  end  
end

