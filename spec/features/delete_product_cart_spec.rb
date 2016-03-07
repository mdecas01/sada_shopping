require 'spec_helper'

  describe "Deleting a product from a cart" do
    
    it "removes the product product from the list" do
      product1 = Product.create!(product_details)

      cart = Cart.create!
      cart.add_product_item(product1)
      
      visit edit_cart_path(cart)

      click_link "Delete product"

      expect(page).not_to have_text("Folding Chair")
    end
  end