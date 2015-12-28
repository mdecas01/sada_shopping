require 'spec_helper'

  describe "creating an order" do
  	it "associates product items to orders" do
      product = Product.create(product_details)
      c = Cart.new
      c.add_product_item(product)

      order = Order.create( address:"123 bernondsey, london", payment_type: "Check")
      order.add_product(c) 

      expect(order.product_items.size).to eq(1)
  	end	

    it "associates a user name to the order" do
      product = Product.create(product_details)
      user = User.create!(user_details)

      c = Cart.new
      c.add_product_item(product)

      order = Order.create!(user: user, address:"123 bernondsey, london", payment_type: "Check")
      order.add_product(c) 

      expect(order.user).to eq(user)
    end 
  end