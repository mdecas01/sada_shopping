class Order < ActiveRecord::Base
	has_many :product_items, dependent: :destroy
  belongs_to :user

	PAYMENT = ["Check", "Credit card", "Purchase order"]
	DISPATCHED = ["YES","NO"]
	validates :payment_type, inclusion: { in: PAYMENT }
    
    #fetches products from the cart and adds to the order's product items
	def add_product(cart)
      cart.product_items.each do |product|
        product.cart_id = nil
      	product_items << product
      end	
	end	

	def send_email?
      if dispatched == "YES"
      	true
      else
        false
      end  	
	end	

  #checks if the product was already dispatched
  def order_dispatched?
    if dispatched == 'YES'
      true
    else
      false
    end    
  end  

  def discount_total(amount)
    #transforms the amount in a decimal number and reduces the total
    self.total = (self.total - (self.total * (amount * 0.01))).round(2)
  end  
end

