require 'spec_helper'

  describe "creating an order" do
  	it "associates product items to orders" do
      product = Product.create(product_details)
      c = Cart.new
      c.add_product_item(product)

      order = Order.create(name: "rodrigo", address:"123 bernondsey, london", email:"example@example.com", payment_type: "Card")
      order.add_product(c) 

      expect(order.product_items.size).to eq(1)
  	end	
  end