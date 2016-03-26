require 'spec_helper'

  describe "Deleting a product from a cart" do
    
    it "removes the product product from the list" do
      product1 = Product.create!(product_details)
      user = User.create!(user_details)
      sign_in_user(user)

      visit product_url(product1)
      click_button "Add to cart"
      click_link "Edit cart"
      click_link "Delete product"

      expect(page).not_to have_text("Folding Chair")
    end
  end