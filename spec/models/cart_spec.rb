require 'spec_helper'

  describe "Adding a product to a cart" do
  	it "increases the size of the product items list" do
      product = Product.create(product_details)

      cart = Cart.new
      cart.add_product_item(product)
      cart.save

      expect(cart.product_items.count).to eq(1)
  	end	
  end
    /
    it "changes the quantity of a product" do
      product = Product.create(name: "Folding chair",
                             description: "Easy to store, folding chair",
                             price: 10.99,
                             quantity: 1,
                             image_url: "folding-chair.jpg")

      cart = Cart.new
      cart.add_product_item(product)
      cart.add_product_item(product)
      cart.save
      item = cart.product_items.find_by(product_id: product.id)

      expect(item.quantity).to eq(2)
    end
  end
/
  describe "The cart" do
    it "shows the total price of the shopping cart" do
      product = Product.create(name: "Folding chair",
                             description: "Easy to store, folding chair",
                             price: 10.99,
                             quantity: 1,
                             image_url: "folding-chair.jpg")

      cart = Cart.new
      cart.add_product_item(product)
      cart.save

      expect(cart.total_price).to eq(10.99)
    end  
  end  