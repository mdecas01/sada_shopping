class Cart < ActiveRecord::Base

  has_many :product_items, dependent: :destroy	
  belongs_to :user

  def add_product_item(product)
    productItem = Product.find(product.id)
    item = product_items.find_by(product_id: product.id)
    if item
      item.quantity += 1
      productItem.quantity -= 1
      productItem.save
    else
      item = product_items.build(product_id: product.id)
      productItem.quantity -= 1
      productItem.save
    end
    item
  end	

  def total_price
    product_items.to_a.sum { |item| item.total_price }
  end  
end
