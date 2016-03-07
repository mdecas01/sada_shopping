require 'spec_helper'

  describe "Editing a cart" do
    
    it "changes the quantity of each product" do
      product1 = Product.create!(product_details)

      cart = Cart.create!
      cart.add_product_item(product1)
      
      visit edit_cart_path(cart)

      select "2", from: "quantity"
      click_button "Update item"

      expect(page).to have_text("2x	Folding Chair")
    end
  end