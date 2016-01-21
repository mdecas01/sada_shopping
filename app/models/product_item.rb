class ProductItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  belongs_to :cart

  def total_price
    Product.find(product_id).price * quantity
  end
end
