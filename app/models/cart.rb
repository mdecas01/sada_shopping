class Cart < ActiveRecord::Base

  has_many :product_items, dependent: :destroy	
  belongs_to :user

  def add_product_item(product)
    item = product_items.find_by(product_id: product.id)
    if item
      item.quantity += 1
    else
      item = product_items.build(product_id: product.id)
    end
    item
  end	

  def total_price
    product_items.to_a.sum { |item| item.total_price }
  end  
end
