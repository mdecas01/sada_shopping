class Order < ActiveRecord::Base
	has_many :product_items, dependent: :destroy

	validates :name, :address, :email, presence: true

	PAYMENT = ["Check", "Credit card", "Purchase order"]
	validates :payment_type, inclusion: { in: PAYMENT }
    
    #fetches products from the cart and adds to the order's product items
	def add_product(cart)
      cart.product_items.each do |product|
        product.cart_id = nil
      	product_items << product
      end	
	end	
end
